$Urls = @()
$Urls = "https://armyleave.xyz",
"https://eventsnigeria.com"


$Result = @()


$MinimumCertAgeDays = 5000
$ErrorActionPreference= 'silentlycontinue'

Foreach ($url in $Urls)
{
[Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

$req = [Net.HttpWebRequest]::Create($url)
$req.GetResponse() | Out-Null
#$req.ServicePoint.Certificate.GetExpirationDateString()

$ExpirationDate = $req.ServicePoint.Certificate.GetExpirationDateString()
$ExpDateToDT = [Datetime]::ParseExact($ExpirationDate, "dd/MM/yyyy hh:mm:ss", $null)
$DayCount = ( $( $ExpDateToDT ) - $( Get-Date ) ).Days

$certName = $req.ServicePoint.Certificate.GetName()
    $certPublicKeyString = $req.ServicePoint.Certificate.GetPublicKeyString()
    $certSerialNumber = $req.ServicePoint.Certificate.GetSerialNumberString()
    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
    $certEffectiveDate = $req.ServicePoint.Certificate.GetEffectiveDateString()
    $certIssuer = $req.ServicePoint.Certificate.GetIssuerName()

If ( $DayCount -le $MinimumCertAgeDays )
 {  
 
  
 $Result += "
   ---Certificate for Host: $url  Expires on ----->  $ExpirationDate 
   ---Certificate for Host: $url  Expires in ----->  $DayCount DAYS"  
       

 }
 
 else
    {
        Write-Host WARNING: Cert for site $url expires in $certExpiresIn days [on $expiration] -f Red
        Write-Host Threshold is $minimumCertAgeDays days. Check details:`nCert name: $certName -f Red
        Write-Host Cert public key: $certPublicKeyString -f Green
        Write-Host Cert serial number: $certSerialNumber`nCert thumbprint: $certThumbprint`nCert effective date: $certEffectiveDate`nCert issuer: $certIssuer -f Green
    }

}


Write-Output $Result -f Green


# Sender and Recipient Info
$MailFrom = "alexandros.ananikidis@sag-ag.ch"
$MailTo = "alexandros.ananikidis@sag-ag.ch"

# Sender Credentials
$Username = "alexandros.ananikidis@sag-ag.ch"
$Password = "Mypass"

# Server Info
$SmtpServer = "smtp-mail.outlook.com"
$SmtpPort = "587"

# Message stuff
$MessageSubject = "Live your best life now" 
$Message = New-Object System.Net.Mail.MailMessage $MailFrom,$MailTo
$Message.IsBodyHTML = $true
$Message.Subject = $MessageSubject
$Message.Body = $Result 

# Construct the SMTP client object, credentials, and send
$Smtp = New-Object Net.Mail.SmtpClient($SmtpServer,$SmtpPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)
$Smtp.Send($Message)