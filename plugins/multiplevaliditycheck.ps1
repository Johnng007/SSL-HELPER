$minimumCertAgeDays = 60
$timeoutMilliseconds = 9000000
#$urls = Read-Host -Prompt 'Input URL - e.g https://john.ng'
$input = Read-Host -Prompt 'Input File Name - e.g .\check-urls.txt'
$urls = get-content $input

#disabling the cert validation check. This is what makes this whole thing work with invalid certs...


foreach ($url in $urls)
{
	[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
    Write-Host Checking $url -f Green
	
    $req = [Net.HttpWebRequest]::Create($url)
    $req.Timeout = $timeoutMilliseconds
    $req.AllowAutoRedirect = $false
    try {$req.GetResponse() |Out-Null} catch {Write-Host Exception while checking URL $url`: $_ -f Green}
    $certExpiresOnString = $req.ServicePoint.Certificate.GetExpirationDateString()
    #Write-Host "Certificate expires on (string): $certExpiresOnString"
    [datetime]$expiration = [System.DateTime]::Parse($req.ServicePoint.Certificate.GetExpirationDateString())
    #Write-Host "Certificate expires on (datetime): $expiration"
    [int]$certExpiresIn = ($expiration - $(get-date)).Days
    $certName = $req.ServicePoint.Certificate.GetName()
    $certPublicKeyString = $req.ServicePoint.Certificate.GetPublicKeyString()
    $certSerialNumber = $req.ServicePoint.Certificate.GetSerialNumberString()
    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
    $certEffectiveDate = $req.ServicePoint.Certificate.GetEffectiveDateString()
    $certIssuer = $req.ServicePoint.Certificate.GetIssuerName()
    if ($certExpiresIn -gt $minimumCertAgeDays)
    {
		Start-Transcript -Path $PSScriptRoot\$certName.txt
        Write-Host Cert for site $url expires in $certExpiresIn days [on $expiration] -f Green
		Write-Host
		#Write-Host Threshold is $minimumCertAgeDays days. Check details:`nCert name: $certName -f Red
		Write-Host Cert name: $certName -f Green 
        Write-Host Cert public key: $certPublicKeyString -f Green 
		Write-Host 
        Write-Host Cert serial number: $certSerialNumber`nCert thumbprint: $certThumbprint`nCert issuance date: $certEffectiveDate`nCert issuer: $certIssuer -f Green
		Stop-Transcript
    }
    else
    {
		Start-Transcript -Path $PSScriptRoot\$certName.txt
        Write-Host WARNING: Cert for site $url expires in $certExpiresIn days [on $expiration] -f Red 
        Write-Host NOTE: Measuring Threshold is $minimumCertAgeDays days.  
		Write-Host Cert name: $certName -f Green
        Write-Host Cert public key: $certPublicKeyString -f Green 
		Write-Host 
        Write-Host Cert serial number: $certSerialNumber`nCert thumbprint: $certThumbprint`nCert issuance date: $certEffectiveDate`nCert issuer: $certIssuer -f Green 
		Stop-Transcript
    }
    Write-Host
    rv req
    rv expiration
    rv certExpiresIn
	
}

Write-Host Checking Completed......
Write-Host Enter the Number of Seconds to wait before closing!
Start-Sleep