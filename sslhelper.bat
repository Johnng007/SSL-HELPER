:: ==================================================================================
:: NAME     : SSL GENERATOR AND CONVERTER
:: AUTHOR   : Ebuka John Onyejegbu.
:: CONTACT  : onyejegbujohne@gmail.com
:: VERSION  : 2.4.
:: PROJECT  : https://github.com/Johnng007/SSL-HELPER
:: A cup of Coffee (-_-)   : bitcoin: bc1qhx2zvlvnevq3vvwjzpn04cjevl0w7ehfdzzvgw
::                         : https://www.buymeacoffee.com/ebuka
:: ==================================================================================

:: /************************************************************************************/
:: Screen settings.
:: /************************************************************************************/


@echo off
echo       " _______  _______  _                                  ";
echo       "(  ____ \(  ____ \( \                                 ";
echo       "| (    \/| (    \/| (                                 ";
echo       "| (_____ | (_____ | |                                 ";
echo       "(_____  )(_____  )| |                                 ";
echo       "      ) |      ) || |                                 ";
echo       "/\____) |/\____) || (____/\                           ";
echo       "\_______)\_______)(_______/                           ";
echo       "                                                      ";
echo       "          _______  _        _______  _______  _______ ";
echo       "|\     /|(  ____ \( \      (  ____ )(  ____ \(  ____ )";
echo       "| )   ( || (    \/| (      | (    )|| (    \/| (    )|";
echo       "| (___) || (__    | |      | (____)|| (__    | (____)|";
echo       "|  ___  ||  __)   | |      |  _____)|  __)   |     __)";
echo       "| (   ) || (      | |      | (      | (      | (\ (   ";
echo       "| )   ( || (____/\| (____/\| )      | (____/\| ) \ \__";
echo       "|/     \|(_______/(_______/|/       (_______/|/   \__/";
echo       "                                                      ";  
echo       "                                                  v2.4";

timeout 5


:mode

echo off
title SSLHELPER: CONVERT AND GENERATE SSL CERTIFICATES.
color 0A
mode con: cols=160 lines=78

goto OPENSSL
:: /************************************************************************************/


:: Print Top Text.
:: /*************************************************************************************/
:print
cls
echo.  =============================================================
echo.  ====              ***  SSLHELPER ***                     ====
echo.  ====    BATCH SCRIPT FOR SSL CONVERSION AND GENERATION.  ====
echo.  =============================================================
echo.%*
echo.

goto :eof
:: /************************************************************************************/


:: Checking for OpenSSL.
:: /************************************************************************************/

:OPENSSL
@ECHO OFF
if exist "%cd%\openssl.exe" (
    goto terms
) else (

echo.    OpenSSL file is not within this batch script folder
echo.    Trying to Fetch it From Repo.
timeout 5

start cmd /c bitsadmin.exe /transfer "Downloading OpenSSL" /download /priority FOREGROUND %1 %2 "https://github.com/Johnng007/SSL-Converter/raw/main/openssl.exe" "%cd%\openssl.exe"
timeout 10
)
goto OPENSSL2

:OPENSSL2
if exist "%cd%\openssl.exe" (
    echo File Downloaded successfully........
	echo Stating the Main File........
	timeout 5
	goto terms
	
) else (
    
    echo Error downloading open ssl -- Make sure you have internet access.
    echo This tool cannot function without OpenSSL in its folder.
    echo Manually download and move it to this directory here: https://github.com/Johnng007/SSL-Converter/raw/main/openssl.exe	
	timeout 5
	
)


echo.Press any key to continue . . .
pause>nul
goto :eof


:: /************************************************************************************/


:: Terms.
:: /*************************************************************************************/
:terms
call :print .
echo.  ================================================
echo.  ====        Terms and Conditions.        =======
echo.  ================================================

echo.  ===============================================================================================================
echo.    This script converts SSL certificates into different formarts, and also generate self signed
echo.    If you are running this script in a controlled environment please be sure you have express permission to do so.
echo.    Some actions of this script may be flagged by some Intrusion Detection Systems.
echo.    Author: onyejegbujohne@gmail.com
echo.  ===============================================================================================================
echo.

choice /c YN /n /m "Do you want to continue with this process? (Yes/No) "
if %errorlevel% EQU 1 goto Menu
if %errorlevel% EQU 2 goto Close

echo.
echo.An unexpected error has occurred.
echo.
echo.Press any key to continue . . .
pause>nul
goto :eof
:: /*************************************************************************************/


:: Menu of tool.
:: /*************************************************************************************/
:Menu
echo. 
call :print MAIN MENU.

echo.   =================================
echo.     CONVERTING FROM PEM  
echo.   =================================
echo.     1. PEM to DER.
echo.     2. PEM to P7B.
echo.     3. PEM(.PEM, .CRT, .CER) TO PFX
echo.
echo.   =================================
echo      CONVERTING FROM DER
echo.   =================================
echo.     4. DER(.CRT .CER .DER) TO PEM.
echo.     5. DER TO CER.
echo.
echo.   =================================
echo      CONVERTING FROM P7B
echo.   =================================
echo.     6. P7B TO PEM.
echo.     7. P7B TO PFX.
echo.     8. P7B TO CER.
echo.
echo.   =================================
echo      CONVERTING FROM PFX
echo.   =================================
echo.     9. PFX TO PEM.
echo.    10. EXTRACT KEY File From PFX
echo.    11. PFX TO CRT
echo.
echo.   =================================
echo      CONVERTING FROM CER
echo.   =================================
echo.    12. CER TO P7B
echo.    13. CER TO PFX
echo.    14. CER TO DER
echo.
echo.   =================================
echo.     DECRYPT A KEY File
echo.   =================================
echo.    15. DECRYPT KEY FILE 
echo.
echo.   =================================
echo      CERTIFICATE GENERATION
echo.   =================================
echo.    16. GENERATE SELF SIGNED
echo.    17. GENERATE SELF SIGNED AUTO
echo.
echo.   ====================================================
echo.      AUDIT
echo.   ====================================================
echo.    18. CHECK SSL DETAILS AND VALIDITY
echo.    19. CHECK SSL DETAILS AND VALIDITY (MULTIPLE URLs)
echo.
echo.   =======================================
echo.      ADVANCED (POWERSHELL PLUGINS)
echo.   =======================================
echo.    20. PLUGINS
echo.
echo.    21. Close.
echo.
echo. [--u]Usage  [--h]Help [--update]Update
echo.

set /p option=Select option: 

if %option% EQU 1 (
    call :PEMDER
) else if %option% EQU 2 (
    call :PEMP7B
) else if %option% EQU 3 (
    call :PEMPFX
)else if %option% EQU 4 (
    call :DERPEM	
)else if %option% EQU 5 (
    call :DERCER
)else if %option% EQU 6 (
    call :P7BPEM
)else if %option% EQU 7 (
    call :P7BPFX
)else if %option% EQU 8 (
    call :P7BCER	
)else if %option% EQU 9 (
    call :PFXPEM
)else if %option% EQU 10 (
    call :PFXKEY	
)else if %option% EQU 11 (
    call :PFXCRT		
)else if %option% EQU 12 (
    call :CERP7B
)else if %option% EQU 13 (
    call :CERPFX
)else if %option% EQU 14 (
    call :CERDER
)else if %option% EQU 15 (
    call :KEYDECRYPT		
)else if %option% EQU 16 (
    call :CHECKCNF	
)else if %option% EQU 17 (
    call :CHECKCNFAUTO	
)else if %option% EQU 18 (
     call :cert1
)else if %option% EQU 19 (
     call :cert2
)else if %option% EQU 20 (
     call :PLUGINS
)else if %option% EQU 21 (
    goto Close
    
)else if %option% EQU --u (
    call :--USAGE		
)else if %option% EQU --h (
    call :--help
)else if %option% EQU --update (	
	call :--update
	
 
) else (
    echo.
    echo.Invalid option.
    echo.
    echo.Press any key to continue . . .
    pause>nul
)

goto Menu
:: /*************************************************************************************/
:: CONVERTING PEM TO DER.
:: /*************************************************************************************/
:PEMDER

call :print Setting up Files to be converted
echo.  =======================================
echo.  ===     CONVERTING PEM TO DER       ===
echo.  =======================================
SETLOCAL EnableDelayedExpansion
SET /P "PEMFile=Enter PEM file and location e.g c:\SSL\cert.pem: "
ECHO Is this the correct File and Location !PEMFile! ?
ECHO NOTE: The PEM file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!PEMFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating DER File now ...
openssl x509 -outform der -in "%SourcePath%" -out "%DateTime%.der"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: CONVERTING PEM TO P7B.
:: /*************************************************************************************/
:PEMP7B

call :print Setting up Files to be converted
echo.  =====================================
echo.  ===     CONVERTING PEM TO P7B    ===
echo.  =====================================
SETLOCAL EnableDelayedExpansion
SET /P "PEMFile=Enter PEM or CRT file and location e.g c:\SSL\cert.pem: "
ECHO Is this the correct File and Location !PEMFile! ?
SET /P "CAFile=Enter CA file and location e.g c:\SSL\cACert.cer: "
ECHO Is this the correct File and Location !CAFile! ?
PAUSE

SET "SourcePath=!PEMFile!"
SET "CApath=!CAFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating P7B File now ...
openssl crl2pkcs7 -nocrl -certfile "%SourcePath%" -out "%DateTime%.p7b" -certfile "%CApath%"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: CONVERTING PEM (.pem, .crt, .cer) TO PFX.
:: /*************************************************************************************/
:PEMPFX

call :print Setting up Files to be converted
echo.  ==========================================
echo.  ===      CONVERTING PEM TO PFX         ===
echo.  ==========================================
SETLOCAL EnableDelayedExpansion
::SET /P "CRTFile=Enter CAcert file and location e.g c:\SSL\Certfile.crt: "
::ECHO Is this the correct File and Location !CRTFile! ?
SET /P "CertFile=Enter Certificate file and location e.g c:\SSL\Certificate.crt: "
ECHO Is this the correct File and Location !CertFile! ?
SET /P "KeyFile=Enter Private Key file and location e.g c:\SSL\privatekey.key: "
ECHO Is this the correct File and Location !KeyFile! ?
PAUSE

::SET "CRTpath=!CRTFile!"
SET "CertPath=!CertFile!"
SET "KeyPath=!KeyFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PFX File now ...
openssl pkcs12 -export -out "%DateTime%.pfx" -inkey "%KeyPath%" -in "%CertPath%"

PAUSE
call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::                            END OF PEN CONVERTION
:: /*************************************************************************************/
:: /*************************************************************************************/
::                           START OF DER CONVERTION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: DER(.CRT .CER .DER) TO PEM
:: /*************************************************************************************/
:DERPEM

call :print Setting up Files to be converted
echo.  =====================================================
echo.  ===    CONVERTING DER(.CRT .CER .DER) TO PEM      ===
echo.  =====================================================
SETLOCAL EnableDelayedExpansion
SET /P "DERFile=Enter DER|CRT|CER file and location e.g c:\SSL\der.cer: "
ECHO Is this the correct File and Location !DERFile! ?
ECHO NOTE: The PEM file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!DERFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating DER File now ...
openssl x509 -inform der -in "%SourcePath%" -out "%DateTime%.pem"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: DER TO CER
:: /*************************************************************************************/
:DERCER

call :print Setting up Files to be converted
echo.  ========================================
echo.  ===      CONVERTING DER TO CER       ===
echo.  ========================================
SETLOCAL EnableDelayedExpansion
SET /P "DERFile=Enter DER file and location e.g c:\SSL\der.der: "
ECHO Is this the correct File and Location !DERFile! ?
ECHO NOTE: The CER file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!DERFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating CER File now ...
openssl x509 -inform der -in "%SourcePath%" -out "%DateTime%.cer"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::                            END OF DER CONVERTION
:: /*************************************************************************************/
:: /*************************************************************************************/
::                           START OF P7B CONVERTION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: P7B TO PEM
:: /*************************************************************************************/
:P7BPEM

call :print Setting up Files to be converted
echo.  ========================================
echo.  ===     CONVERTING P7B TO PEM        ===
echo.  ========================================
SETLOCAL EnableDelayedExpansion
SET /P "P7BFile=Enter P7B file and location e.g c:\SSL\cert.p7b: "
ECHO Is this the correct File and Location !P7BFile! ?
ECHO NOTE: The PEM file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!P7BFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PEM File now ...
openssl pkcs7 -print_certs -in "%SourcePath%" -out "%DateTime%.cer"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: P7B TO PFX
:: /*************************************************************************************/
:P7BPFX
call :print Setting up Files to be converted
echo.  =======================================
echo.  ===     CONVERTING P7B TO PFX       ===
echo.  =======================================
SETLOCAL EnableDelayedExpansion
SET /P "P7BFile=Enter P7B file and location e.g c:\SSL\cert.p7b: "
ECHO Is this the correct File and Location !P7BFile! ?
SET /P "CRTFile=Enter CAcert file and location e.g c:\SSL\Certfile.cer: "
ECHO Is this the correct File and Location !CRTFile! ?
SET /P "CertFile=Enter Certificate file and location e.g c:\SSL\Certificate.crt: "
ECHO Is this the correct File and Location !CertFile! ?
SET /P "KeyFile=Enter Private Key file and location e.g c:\SSL\privatekey.key: "
ECHO Is this the correct File and Location !KeyFile! ?
PAUSE

SET "SourcePath=!PB7File!"
SET "CRTpath=!CRTFile!"
SET "CertPath=!CertFile!"
SET "KeyPath=!KeyFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PFX File now ...

openssl pkcs7 -print_certs -in "%SourcePath%" -out "%DateTime%.cer"
openssl pkcs12 -export -in "%DateTime%.cer" -inkey "%KeyPath%" -out "%DateTime%.pfx" -certfile "%CRTpath%"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: P7B TO CER
:: /*************************************************************************************/
:P7BCER

call :print Setting up Files to be converted
echo.  ==========================================
echo.  ===      CONVERTING P7B TO CER         ===
echo.  ==========================================
SETLOCAL EnableDelayedExpansion
SET /P "P7BFile=Enter P7B file and location e.g c:\SSL\cert.p7b: "
ECHO Is this the correct File and Location !P7BFile! ?
ECHO NOTE: The CER file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!P7BFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating CER File now ...

openssl pkcs7 -print_certs -in "%SourcePath%" -out "%DateTime%.cer"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::                                 END OF P7B CONVERSION
:: /*************************************************************************************/
:: /*************************************************************************************/
::                                 START OF PFX CONVERSION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: PFX TO PEM
:: /*************************************************************************************/
:PFXPEM

call :print Setting up Files to be converted
echo.  =========================================
echo.  ===       CONVERTING PFX TO PEM       ===
echo.  =========================================
SETLOCAL EnableDelayedExpansion
SET /P "PFXFile=Enter P7B file and location e.g c:\SSL\cert.pfx: "
ECHO Is this the correct File and Location !PFXFile! ?
ECHO NOTE: The CER file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!PFXFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PEM File now ...

openssl pkcs12 -in "%SourcePath%" -out "%DateTime%.pem" -nodes

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof


:: /*************************************************************************************/
:: EXTRACT KEY FROM PFX
:: /*************************************************************************************/
:PFXKEY

call :print Setting up Files to be converted
echo.  =============================================
echo.  ===       EXTRACTING KEY FROM PFX         ===
echo.  =============================================
SETLOCAL EnableDelayedExpansion
SET /P "PFXFile=Enter PFX file and location e.g c:\SSL\cert.pfx: "
ECHO Is this the correct File and Location !PFXFile! ?
ECHO NOTE: The CRT file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!PFXFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PEM File now ...

openssl pkcs12 -in "%SourcePath%" -nocerts -out "%DateTime%.key"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: PFX TO CRT
:: /*************************************************************************************/
:PFXCRT

call :print Setting up Files to be converted
echo.  ============================================
echo.  ===       CONVERTING PFX TO CRT          ===
echo.  ============================================
SETLOCAL EnableDelayedExpansion
SET /P "PFXFile=Enter PFX file and location e.g c:\SSL\cert.pfx: "
ECHO Is this the correct File and Location !PFXFile! ?
ECHO NOTE: The CRT file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!PFXFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PEM File now ...

openssl pkcs12 -in "%SourcePath%" -clcerts -nokeys -out "%DateTime%.crt"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::                                 END OF PFX CONVERSION
:: /*************************************************************************************/
:: /*************************************************************************************/
::                                 START OF KEY DECRYPTION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: DECRYPT A PRIVATE KEY
:: /*************************************************************************************/
:KEYDECRYPT

call :print Setting up Files to be converted
echo.  =================================================
echo.  ===        DECRYPTING A PRIVATE KEY           ===
echo.  =================================================
SETLOCAL EnableDelayedExpansion
SET /P "KEYFile=Enter KEY file and location e.g c:\SSL\cert.key: "
ECHO Is this the correct File and Location !KEYFile! ?
ECHO NOTE: The key file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!KEYFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating Decrypted key now ...

openssl rsa -in "%SourcePath%" -out "%DateTime%.key"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof


:: /*************************************************************************************/
::                                 END OF PFX CONVERSION
:: /*************************************************************************************/
:: /*************************************************************************************/
::                                 START OF CER CONVERSION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: CER TO P7B
:: /*************************************************************************************/
:CERP7B
call :print Setting up Files to be converted
echo.  ==============================================
echo.  ===        CONVERTING CER TO P7B           ===
echo.  ==============================================
SETLOCAL EnableDelayedExpansion
SET /P "CertFileInt=Enter Intermediate cert file and location e.g c:\SSL\cert.cer: "
ECHO Is this the correct File and Location !CertFileInt! ?
SET /P "CertFileRacine=Enter CAcert file and location e.g c:\SSL\Certfile.cer: "
ECHO Is this the correct File and Location !CertFileRacine! ?
SET /P "CertFile=Enter Certificate file and location e.g c:\SSL\Certificate.crt: "
ECHO Is this the correct File and Location !CertFile! ?
PAUSE

SET "CertPathInt=!CertFileInt!"
SET "CertFileRacinePath=!CertFileRacine!"
SET "CertPath=!CertFile!"


FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PFX File now ...

openssl crl2pkcs7 -nocrl -certfile "%CertPath%" -certfile "%CertPathInt%" -certfile "%CertFileRacinePath%" -out "%DateTime%.p7b"


call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: CER TO PFX
:: /*************************************************************************************/
:CERPFX
call :print Setting up Files to be converted
echo.  ========================================
echo.  ===     CONVERTING CER TO PFX        ===
echo.  ========================================
SETLOCAL EnableDelayedExpansion
SET /P "CertFileInt=Enter Intermediate cert file and location e.g c:\SSL\cert.cer: "
ECHO Is this the correct File and Location !CertFileInt! ?
SET /P "CertFileRacine=Enter CAcert file and location e.g c:\SSL\Certfile.cer: "
ECHO Is this the correct File and Location !CertFileRacine! ?
SET /P "CertFile=Enter Certificate file and location e.g c:\SSL\Certificate.crt: "
ECHO Is this the correct File and Location !CertFile! ?
SET /P "KeyFile=Enter Private Key file and location e.g c:\SSL\privatekey.key: "
ECHO Is this the correct File and Location !KeyFile! ?

PAUSE

SET "CertPathInt=!CertFileInt!"
SET "CertFileRacinePath=!CertFileRacine!"
SET "CertPath=!CertFile!"
SET "KeyPath=!KeyFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating PFX File now ...

openssl pkcs12 -in "%CertPath%" -certfile "%CertPathInt%" -certfile "%CertFileRacinePath%" -inkey %KeyPath% -export -out "%DateTime%.pfx"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: CER TO DER
:: /*************************************************************************************/
:CERDER

call :print Setting up Files to be converted
echo.  ============================================
echo.  ===      CONVERTING CER TO DER           ===
echo.  ============================================
SETLOCAL EnableDelayedExpansion
SET /P "CertFile=Enter CER file and location e.g c:\SSL\cert.cer: "
ECHO Is this the correct File and Location !CertFile! ?
ECHO NOTE: The DER file will be dumped to the folder of this batch file
PAUSE

SET "SourcePath=!CertFile!"

FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%_%DTS:~8,2%-%DTS:~10,2%-%DTS:~12,2%

ECHO Creating CER File now ...

openssl x509 -in "%SourcePath%" -outform der -out "%DateTime%.der"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::                   END OF CONVERSIONS
:: /*************************************************************************************/
:: /*************************************************************************************/
::                   START OF SELF SIGNED CERTIFICATE GENERATION
:: /*************************************************************************************/

:CHECKCNF

:: /************************************************************************************/
:: Checking for CNF.
:: /************************************************************************************/

@ECHO OFF
if exist "%cd%\openssl.cnf" (
    goto SELFSIGNED
) else (

echo.    OpenSSL cnf file is not within this batch script folder
echo.    Trying to Fetch it From Repo.
timeout 5

start cmd /c bitsadmin.exe /transfer "Downloading OpenSSL CNF" /download /priority FOREGROUND %1 %2 "https://github.com/Johnng007/SSL-Converter/raw/main/openssl.cnf" "%cd%\openssl.cnf"
timeout 10
)
goto CHECKCNF2

:CHECKCNF2
if exist "%cd%\openssl.cnf" (
    echo File Downloaded successfully........
	echo Stating the Main File........
	timeout 5
	goto SELFSIGNED
	
) else (
    
    echo Error downloading openssl cnf -- Make sure you have internet access.
    echo This tool cannot function without OpenSSL in its folder.
    echo Manually download and move it to this directory here: https://github.com/Johnng007/SSL-Converter/raw/main/openssl.cnf	
	timeout 5
	
)


echo.Press any key to continue . . .
pause>nul
goto :eof

:: /************************************************************************************/
:: Checking for CNF AUTO.
:: /************************************************************************************/
:CHECKCNFAUTO

@ECHO OFF
if exist "%cd%\openssl.cnf" (
    goto SELFSIGNEDAUTO
) else (

echo.    OpenSSL cnf file is not within this batch script folder
echo.    Trying to Fetch it From Repo.
timeout 5

start cmd /c bitsadmin.exe /transfer "Downloading OpenSSL CNF" /download /priority FOREGROUND %1 %2 "https://github.com/Johnng007/SSL-Converter/raw/main/openssl.cnf" "%cd%\openssl.cnf"
timeout 10
)
goto CHECKCNFAUTO2

:CHECKCNFAUTO2
if exist "%cd%\openssl.cnf" (
    echo File Downloaded successfully........
	echo Stating the Main File........
	timeout 5
	goto SELFSIGNEDAUTO
	
) else (
    
    echo Error downloading openssl cnf -- Make sure you have internet access.
    echo This tool cannot function without OpenSSL in its folder.
    echo Manually download and move it to this directory here: https://github.com/Johnng007/SSL-Converter/raw/main/openssl.cnf	
	timeout 5
	
)


echo.Press any key to continue . . .
pause>nul
goto :eof

:: /************************************************************************************/
:: GENERATE SELF SIGNED
:: /************************************************************************************/
:SELFSIGNED
call :print setting up parameters for self signed certificate
echo.  =================================================
echo.  ===   GENERATING A SELF SIGNED CERTIFICATE    ===
echo.  =================================================
SETLOCAL EnableDelayedExpansion
SET /P "C=Enter Country Code e.g US: "
SET /P "ST=Enter State e.g Lagos: "
SET /P "L=Enter Locality Code e.g Victoria Island: "
SET /P "O=Enter Organization e.g Microsoft: "
SET /P "OU=Enter Organization Unit e.g Security: "
SET /P "CN=Enter Common Name e.g microsoft.com: "

SET "C=!C!"
SET "ST=!ST!"
SET "L=!L!"
SET "O=!O!"
SET "OU=!OU!"
SET "CN=!CN!"

openssl req -newkey rsa:4096 -days 1001 -nodes -x509 -subj "/C=%C%/ST=%ST%/L=%L%/O=%O%/OU=%OU%/CN=%CN%" -extensions SAN -config ".\openssl.cnf" -keyout "SELF-SIGNED.key" -out "SELF-SIGNED.crt"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: GENERATE SELF SIGNED AUTO
:: /*************************************************************************************/
:SELFSIGNEDAUTO

call :print Inititing auto cert generation
echo.  =================================================
echo.  === GENERATING A SELF SIGNED CERTIFICATE AUTO ===
echo.  =================================================
SETLOCAL EnableDelayedExpansion

openssl req -newkey rsa:4096 -days 1001 -nodes -x509 -subj "/C=US/ST=California/L=San Francisco/O=Twitch/OU=web/CN=localhost" -extensions SAN -config ".\openssl.cnf" -keyout "SELF SIGNED.key" -out "SELF-SIGNED.crt"

call :print File created Successfully.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: END OF SELF SIGNED CERTIFICATE GENERATION
:: /*************************************************************************************/
:: /*************************************************************************************/
:: START OF HELP OPTIONS
:: /*************************************************************************************/
:: /*************************************************************************************/
:: USAGE OPTION
:: /*************************************************************************************/
:--USAGE
echo. ==========================
echo. ===   INTRODUCTION    ====
echo. ==========================
echo. SSL HELPER IS A FEATURE RICH TOOL FOR MANAGING YOUR SSL CERTFICATES
echo. IT DEPENDS ON OPENSSL WHICH IT WILL TRY TO DOWNLOAD ON ITS OWN.
echo. 
echo. =================================
echo. ===   SELECTING AN OPTION    ====
echo. =================================
echo. WHEN ASKED TO SELECT AN OPTION, 
echo. SELECT THE NUMBER ASSOCIATED WITH THE ACTION YOU WISH TO PERFORM.
echo.
echo. ==========================
echo. ===     EXAMPLES      ====
echo. ==========================
echo. e.g select 1 for PEM to DER
echo.
echo. OR SELECT ANY OF THE HELP OPTIONS 
echo.
echo. e.g select --h for HELP
echo.
SETLOCAL EnableDelayedExpansion

echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: HELP OPTION
:: /*************************************************************************************/
:--HELP
echo. ==========================
echo. ===   INTRODUCTION    ====
echo. ==========================
echo. SSL HELPER IS A FEATURE RICH TOOL FOR MANAGING YOUR SSL CERTFICATES
echo. IT DEPENDS ON OPENSSL WHICH IT WILL TRY TO DOWNLOAD ON ITS OWN.
echo. 
echo. =================================
echo. ===   SELECTING AN OPTION    ====
echo. =================================
echo. WHEN ASKED TO SELECT AN OPTION, 
echo. SELECT THE NUMBER ASSOCIATED WITH THE ACTION YOU WISH TO PERFORM.
echo.
echo. ==========================
echo. ===     EXAMPLES      ====
echo. ==========================
echo. e.g select 1 for PEM to DER
echo.
echo. OR SELECT ANY OF THE HELP OPTIONS 
echo.
echo. e.g select --h for HELP
echo.
echo. e.g select --h for HELP
echo.
echo. =================================
echo. ===     NEED MORE HELP?      ====
echo. =================================
echo. GITHUB: https://github.com/Johnng007/SSL-HELPER
echo.
echo. EMAIL: onyejegbujohne@gmail.com
echo. 
echo. WEBSITE: https://john.ng
echo.
SETLOCAL EnableDelayedExpansion
echo.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
:: CHECK FOR UPDATE
:: /*************************************************************************************/
:--UPDATE


@echo off

start cmd /c bitsadmin.exe /transfer "Downloading Update File" /download /priority FOREGROUND %1 %2 "https://raw.githubusercontent.com/Johnng007/SSL-HELPER/main/version.txt" "%cd%\version.txt"

for /f "tokens=* delims=" %%v in (version.txt) do set "version=%%v"

if "%version%" NEQ "v1.4" (
echo. An update was found. Now updating........
::rd /s /q tmp
mkdir tmp
start cmd /c bitsadmin.exe /transfer "Downloading Updated SSLHELPER" /download /priority FOREGROUND %1 %2 "https://github.com/Johnng007/SSL-HELPER/raw/main/SSLHELPER.bat" "%cd%\tmp\SSLHELPER.bat"
timeout 10

echo. TIDYING MYSELF UP

robocopy "%cd%\tmp" "%cd%" SSLHELPER.bat /move 

rd /s /q tmp

del  /q version.txt >nul 2>&1

echo. Update complete......
exit



)else (
    
    echo. CONGRATULATIONS YOUR COPY OF SSL HELPER IS UP TO DATE
	timeout 5
	
)

goto TIDYUP

:TIDYUP

SETLOCAL EnableDelayedExpansion
echo.
echo.Press any key to continue . . .
pause>nul
goto :Menu



:: /*************************************************************************************/
:: SINGLE URL CERT CHECK
:: /*************************************************************************************/
:cert1
call :print Setting up Requirements
echo. ============================================
echo. ===   CHECK THE SSL DETAILS OF A URL    ====
echo. ===   REQUIRES JAVA KEYTOOOL            ====
echo. ============================================
echo. THIS MODULE HELPS YOU CHECK THE SSL DETAILS OF A URL
echo. RESULT WILL BE OUTPUTED IN A TXT FILE IN THE CURRENT WORKING DIRECTORY
echo. 
SETLOCAL EnableDelayedExpansion
SET /P "URL=ENTER URL TO CHECK WITHOUT 'https://' e.g john.ng :: "
::SET /P "ST=Enter State e.g Lagos: "
::SET /P "L=Enter Locality Code e.g Victoria Island: "
::SET /P "O=Enter Organization e.g Microsoft: "
::SET /P "OU=Enter Organization Unit e.g Security: "
::SET /P "CN=Enter Common Name e.g microsoft.com: "

SET "URL=!URL!"
::SET "ST=!ST!"
::SET "L=!L!"
::SET "O=!O!"
::SET "OU=!OU!"
::SET "CN=!CN!"

keytool -printcert -v -sslserver %URL% > certificate_details_for_%URL%.txt

::keytool -list -printcert -v -sslserver %URL%

echo.
echo. Done
echo. Output has been saved as certificate_details_for_%URL%.txt




echo.
SETLOCAL EnableDelayedExpansion
echo.
echo.Press any key to continue . . .
pause>nul
goto :eof





:: /*************************************************************************************/
:: MULTIPLE URL CERT CHECK
:: /*************************************************************************************/
:cert2
call :print Setting up Requirements
echo. ===================================================
echo. ===   CHECK THE SSL DETAILS OF MULTIPLE URLs    ====
echo. ===   REQUIRES JAVA KEYTOOOL                   ====
echo. ===================================================
echo. THIS MODULE HELPS YOU CHECK THE SSL DETAILS OF MULTIPLE URLs
echo. IT TAKES IN MULTIPLE URLs IN A TXT FILE: FILE MUST BE IN THE WORKING DIRECTORY.
echo. 
SETLOCAL EnableDelayedExpansion
SET /P "URL=ENTER FILE NAME e.g ssl.txt "
::SET /P "ST=Enter State e.g Lagos: "
::SET /P "L=Enter Locality Code e.g Victoria Island: "
::SET /P "O=Enter Organization e.g Microsoft: "
::SET /P "OU=Enter Organization Unit e.g Security: "
::SET /P "CN=Enter Common Name e.g microsoft.com: "

SET "URL=!URL!"
::SET "ST=!ST!"
::SET "L=!L!"
::SET "O=!O!"
::SET "OU=!OU!"
::SET "CN=!CN!"


for /f %%i in (%URL%) do (

echo Checking %%i... and outputing to file.... 

keytool -printcert -v -sslserver %%i > certificate_details_for_%%i.txt 




echo.
echo. Done
echo. Output has been saved as certificate_details_for_each_URL.txt
)



echo.
SETLOCAL EnableDelayedExpansion
echo.
echo.Press any key to continue . . .
pause>nul
goto :eof



:: /*************************************************************************************/
::  POWERSHELL PLUGINS
:: /*************************************************************************************/
:PLUGINS
call :print Entering Powershell Mode
echo. ................................................
echo. ................................................
call %cd%\plugins\index.bat



echo.
SETLOCAL EnableDelayedExpansion
echo.
echo.Press any key to continue . . .
pause>nul
goto :eof






