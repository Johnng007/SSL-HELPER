$SChannel = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"
New-Item "$($SChannel)\TLS 1.2\Server" -Force
New-Item "$($SChannel)\TLS 1.2\Client" -Force
New-Item $SChannel -Name "TLS 1.0"
New-Item "$($SChannel)\TLS 1.0" -Name Server
New-Item "$($SChannel)\TLS 1.1\Server" –force
New-Item "$($SChannel)\TLS 1.1\Client" –force
New-ItemProperty -Path "$($SChannel)\TLS 1.0\Server" -Name Enabled -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.1\Server" -Name Enabled -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.1\Server" -Name DisabledByDefault -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.1\Client" -Name Enabled -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.1\Client" -Name DisabledByDefault -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.2\Server" -Name Enabled -Value 1 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.2\Server" -Name DisabledByDefault -Value 0 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.2\Client" -Name Enabled -Value 1 -PropertyType DWORD
New-ItemProperty -Path "$($SChannel)\TLS 1.2\Client" -Name DisabledByDefault -Value 0 -PropertyType DWORD
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
foreach($Suite in $OldCipherSuites){
disable-TlsCipherSuite -name $Suite -ErrorAction SilentlyContinue
} 