
function Test-SslProtocol {
    param(
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true,ValueFromPipeline=$true)]
        $URL,

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [int]$Port = 443
    )
    begin {
        $ProtocolNames = [System.Security.Authentication.SslProtocols] |
            Get-Member -Static -MemberType Property |
            Where-Object -Filter { $_.Name -notin @("Default","None") } |
            Foreach-Object { $_.Name }
    }
    process {
        $ProtocolStatus = [Ordered]@{}
        $ProtocolStatus.Add("URL", $URL)
        $ProtocolStatus.Add("Port", $Port)
        $ProtocolStatus.Add("KeyLength", $null)
		
        $ProtocolStatus.Add("SignatureAlgorithm", $null)

        $ProtocolNames | %{
            $ProtocolName = $_
            $Socket = New-Object System.Net.Sockets.Socket( `
                [System.Net.Sockets.SocketType]::Stream,
                [System.Net.Sockets.ProtocolType]::Tcp)
            $Socket.Connect($URL, $Port)
            try {
                $NetStream = New-Object System.Net.Sockets.NetworkStream($Socket, $true)
                $SslStream = New-Object System.Net.Security.SslStream($NetStream, $true)
                $SslStream.AuthenticateAsClient($URL,  $null, $ProtocolName, $false )
                $RemoteCertificate = [System.Security.Cryptography.X509Certificates.X509Certificate2]$SslStream.RemoteCertificate
                $ProtocolStatus["KeyLength"] = $RemoteCertificate.PublicKey.Key.KeySize
                $ProtocolStatus["SignatureAlgorithm"] = $RemoteCertificate.SignatureAlgorithm.FriendlyName
                $ProtocolStatus["Certificate"] = $RemoteCertificate
                $ProtocolStatus.Add($ProtocolName, $true)
            } catch  {
                $ProtocolStatus.Add($ProtocolName, $false)
            } finally {
                $SslStream.Close()
            }
        }
        [PSCustomObject]$ProtocolStatus
		
		Write-Host VULNERABILITY ANALYSIS
		
		if ($ProtocolStatus["KeyLength"] -lt 2048)
		{
		Write-Host $URL IS VULNERABLE TO SSL KEY BRUTEFORCING!!! -f Red
		Write-Host Rating: Medium -f orange
		Write-Host The recommended minimum sizes "for RSA and ECDSA keys are 2,048 bit and 256 bit", respectively.
		Write-Host "https://cwe.mitre.org/data/definitions/310.html"
		}
		if ($ProtocolStatus["KeyLength"] -ge 2048)
	    {
	     Write-Host CONGRATULATIONS!!! $URL PASSED THE SSL KEY BRUTEFORCE TEST -f Green
	    }
		$a = "SHA-1","MD5","SHA1","MD4","MD2"
		if ($ProtocolStatus["SignatureAlgorithm"] -contains $a)
		{
		Write-Host $URL SSL/TLS Certificate Signed Using Weak Hashing Algorithm!!! -f Red
		Write-Host Rating: Medium -f orange
		Write-Host generate a new SSL/TLS certificate using SHA-2 signature algorithm to replace the existing one.
		Write-Host "https://cwe.mitre.org/data/definitions/327"
		}
		$a = "SHA-1","MD5","SHA1","MD4","MD2"
		if ($ProtocolStatus["SignatureAlgorithm"] -notcontains $a)
		{
		Write-Host CONGRATULATIONS!!! $URL PASSED THE SIGNATURE ALGORITHM CHECK -f Green
		}
		
		Read-Host -Prompt "Press Enter key to continue"
    }
} # function Test-SslProtocol
