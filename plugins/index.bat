
@echo off
:mode

title SSLHELPER: PLUGINS.
color 0A
mode con: cols=160 lines=78
goto Menu


:: /************************************************************************************/
:: Print Top Text.
:: /*************************************************************************************/
:print
cls
echo.  =============================================================
echo.  ====              ***  SSLHELPER PLUGIN  ***             ====
echo.  =============================================================
echo.%*
echo.

goto :eof


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
echo. ===================================================
echo. ===             PLUGINS MENU                   ====
echo. ===================================================
echo. 
echo. 1. Check SSL CERTIFICATE VALIDITY - SINGLE URL.
echo. 2. Check SSL CERTIFICATE VALIDITY - MULTIPLE URL.
ECHO. 3. SSL VULNERABILITY ANALYSIS
echo. 4. CHECK A WINDOWS SERVER'S CIPHER SUITES
echo. 5. FIX A WINDOWS SERVER'S CIPHER SUITES
echo.
echo. 6. CLOSE

set /p option=Select option: 

if %option% EQU 1 (
    call :VALIDITY
) else if %option% EQU 2 (
    call :VALIDITYMULTIPLE
) else if %option% EQU 3 (
    call :VULN
) else if %option% EQU 4 (
    call :CHECKCIPHER
) else if %option% EQU 5 (
    call :FIXCIPHER
)else if %option% EQU 6 (
    goto Close

) else (
    echo.
    echo.Invalid option.
    echo.
    echo.Press any key to continue . . .
    pause>nul
)

goto Menu

:: /*************************************************************************************/
::  Check SSL CERTIFICATE VALIDITY - SINGLE URL.
:: /*************************************************************************************/
:VALIDITY
call :print LOADING POWERSHELL PLUGIN
echo. Loaded The SSL CERTIFICATE VALIDITY PLUGIN.
echo. USAGE: ENTER A URL IN THE PROMPT BELOW TO CHECK ITS SSL VALIDITY!
echo.
Powershell.exe -executionpolicy remotesigned -File  %cd%\validitycheck.ps1

call :print Exiting Plugin.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::  Check SSL CERTIFICATE VALIDITY - MULTIPLE URL.
:: /*************************************************************************************/
:VALIDITYMULTIPLE
call :print LOADING POWERSHELL PLUGIN
echo. Loaded The SSL CERTIFICATE VALIDITY PLUGIN - MULTIPLE URL.
echo. USAGE: ENTER A FILE NAME CONTAINING URLs IN THE PROMPT BELOW!
echo.        RESULT WILL BE DISPLAYED ON THE SCREEN AND ALSO OUTPUTED TO A FILE.
echo.
Powershell.exe -executionpolicy remotesigned -File  %cd%\multiplevaliditycheck.ps1

call :print Exiting Plugin.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::  VULNERABILITY ANALYSIS
:: /*************************************************************************************/
:VULN
call :print LOADING POWERSHELL PLUGIN
echo. THIS PLUGIN WILL BE LOADED IN MEMORY
echo. USAGE: ENTER URL WHEN PROMPTED BELOW e.g www.john.ng
echo.


powershell -command "& { . .\vulnanalysis.ps1; Test-SslProtocol }" 

call :print Exiting Plugin.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::  CHECK A WINDOWS SERVER'S CIPHER SUITES
:: /*************************************************************************************/
:CHECKCIPHER
call :print LOADING POWERSHELL PLUGIN
echo. NOTE: You have to Run this plugin on the server in view. 
echo. Running Check......
echo.


Powershell.exe -executionpolicy remotesigned -File  %cd%\servercipher.ps1

call :print Exiting Plugin.
echo.Press any key to continue . . .
pause>nul
goto :eof

:: /*************************************************************************************/
::  FIX A WINDOWS SERVER'S CIPHER SUITES
:: /*************************************************************************************/
:FIXCIPHER
call :print LOADING POWERSHELL PLUGIN
echo. NOTE: You have to Run this plugin on the server in view.
echo. Running the Fix
echo.


Powershell.exe -executionpolicy remotesigned -File  %cd%\servercipherfix.ps1 

call :print Exiting Plugin.
echo.Press any key to continue . . .
pause>nul
goto :eof