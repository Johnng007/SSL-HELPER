$SChannel = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols" 
$TLS1ServerEnabled = Get-ItemProperty -Path "$($SChannel)\TLS 1.0\Server" -Name Enabled -ErrorAction SilentlyContinue
$TLS11ServerEnabled = Get-ItemProperty -Path "$($SChannel)\TLS 1.1\Server" -Name Enabled -ErrorAction SilentlyContinue
$TLS11ClientEnabled = get-ItemProperty -Path "$($SChannel)\TLS 1.1\Client" -Name Enabled -ErrorAction SilentlyContinue
$TLS12ServerEnabled = get-ItemProperty -Path "$($SChannel)\TLS 1.2\Server" -Name Enabled -ErrorAction SilentlyContinue
$TLS12ClientEnabled = get-ItemProperty -Path "$($SChannel)\TLS 1.2\Client" -Name Enabled -ErrorAction SilentlyContinue

If(!$TLS1ServerEnabled -or $TLS1ServerEnabled -eq 1) { $TLS1ServerEnabled = "TLS Server 1.0 could be enabled. Please investigate"  } else { $TLS1ServerEnabled = "Healthy" }
If(!$TLS11ServerEnabled -or $TLS11ServerEnabled -eq 1) { $TLS11ServerEnabled = "TLS Server 1.1 could be enabled. Please investigate"  }  else { $TLS11ServerEnabled = "Healthy" }
If(!$TLS11ClientEnabled -or $TLS11ClientEnabled -eq 1) { $TLS11ClientEnabled = "TLS Client 1.1 could be enabled.. Please investigate"  }  else { $TLS11ClientEnabled = "Healthy" }
If(!$TLS12ServerEnabled -or $TLS12ServerEnabled -eq 0) { $TLS12ServerEnabled = "TLS Server 1.2 could be disabled. Please investigate"  }  else { $TLS12ServerEnabled = "Healthy" }
If(!$TLS12ClientEnabled -or $TLS12ClientEnabled -eq 0) { $TLS12ClientEnabled = "TLS Client 1.2 could be disabled Please investigate"  }  else { $TLS12ClientEnabled = "Healthy" }

$OldCipherSuites =
@(
    "TLS_DHE_RSA_WITH_AES_256_CBC_SHA"
    "TLS_DHE_RSA_WITH_AES_128_CBC_SHA"
    "TLS_RSA_WITH_AES_256_GCM_SHA384"
    "TLS_RSA_WITH_AES_128_GCM_SHA256"
    "TLS_RSA_WITH_AES_256_CBC_SHA256"
    "TLS_RSA_WITH_AES_128_CBC_SHA256"
    "TLS_RSA_WITH_AES_256_CBC_SHA"
    "TLS_RSA_WITH_AES_128_CBC_SHA"
    "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
    "TLS_DHE_DSS_WITH_AES_256_CBC_SHA256"
    "TLS_DHE_DSS_WITH_AES_128_CBC_SHA256"
    "TLS_DHE_DSS_WITH_AES_256_CBC_SHA"
    "TLS_DHE_DSS_WITH_AES_128_CBC_SHA"
    "TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA"
    "TLS_RSA_WITH_RC4_128_SHA"
    "TLS_RSA_WITH_RC4_128_MD5"
    "TLS_RSA_WITH_NULL_SHA256"
    "TLS_RSA_WITH_NULL_SHA"
    "TLS_PSK_WITH_AES_256_GCM_SHA384"
    "TLS_PSK_WITH_AES_128_GCM_SHA256"
    "TLS_PSK_WITH_AES_256_CBC_SHA384"
    "TLS_PSK_WITH_AES_128_CBC_SHA256"
    "TLS_PSK_WITH_NULL_SHA384"
    "TLS_PSK_WITH_NULL_SHA256"
)
$SuitesEnabled = @()
foreach($Suite in $OldCipherSuites){
$SuitesEnabled += get-TlsCipherSuite -name $Suite
}
if(!$SuitesEnabled){
$SuitesEnabled = "Healthy. No old cipher suites found"
} else {
$SuitesEnabled = "Possible old cipher suites found"
} 

$TLS1ServerEnabled
$TLS11ServerEnabled
$TLS11ClientEnabled 
$TLS12ServerEnabled
$TLS12ClientEnabled
