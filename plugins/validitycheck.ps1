$minimumCertAgeDays = 60
$timeoutMilliseconds = 9000000
$urls = Read-Host -Prompt 'Input URL - e.g https://john.ng'
#$urls = get-content .\check-urls.txt

#disabling the cert validation check. This is what makes this whole thing work with invalid certs...


foreach ($url in $urls)
{
	[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
    Write-Host Checking $urls -f Green
	
    $req = [Net.HttpWebRequest]::Create($urls)
    $req.Timeout = $timeoutMilliseconds
    $req.AllowAutoRedirect = $false
    try {$req.GetResponse() |Out-Null} catch {Write-Host Exception while checking URL $urls`: $_ -f Green}
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
        Write-Host Cert for site $urls expires in $certExpiresIn days [on $expiration] -f Green
    }
    else
    {
        Write-Host WARNING: Cert for site $urls expires in $certExpiresIn days [on $expiration] -f Red
        Write-Host Threshold is $minimumCertAgeDays days. Check details:`nCert name: $certName -f Red
        Write-Host Cert public key: $certPublicKeyString -f Green
		Write-Host 
        Write-Host Cert serial number: $certSerialNumber`nCert thumbprint: $certThumbprint`nCert issuance date: $certEffectiveDate`nCert issuer: $certIssuer -f Green
    }
    Write-Host
    rv req
    rv expiration
    rv certExpiresIn
}

Write-Host Checking Completed......
Write-Host Enter the Number of Seconds to wait before closing!
Start-Sleep