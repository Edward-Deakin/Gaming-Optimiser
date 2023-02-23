@echo off
echo.
echo  Gaming Optimiser  
echo  By: Edward Deakin                 
echo  https://edward.ml 
echo.
echo Welcome to my gaming optimising batch script!
echo This script is designed to find any errors and repair
echo whilst optimising gaming latency and performance.
echo.
echo This script is fully transparent and is fully open-source here:
echo https://placeholder.org
echo.
echo You can also see a VirusTotal scan check here:
echo https://placeholder.org
echo.
echo This script is designed to be ran as administrator.
echo If you have been sent here after completing a previous
echo admin request, it has worked!
echo Please click any key to continue.
echo.
pause >nul
cls
echo.
echo  Gaming Optimiser  
echo  By: Edward Deakin                 
echo  https://edward.ml 
echo.
echo Checking if this script has administrative privileges...
echo.
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo.
    echo Requesting administrative privileges via UAC...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo The script has now succesfully gained admin privileges!
echo.
echo You will be able to see the logs of the optimisation process.
echo.
echo Once ready please click any key to run the process.
echo.
pause >null
cls
echo.
echo  Gaming Optimiser
echo  By: Edward Deakin
echo  https://edward.ml
echo.
echo Executing the optimisation process (logs will be displayed)...
echo.
echo ------------------
echo Step 1/6: SFC scan
echo ------------------
echo:
sfc /scannow
echo.
echo -------------------
echo Step 2/6: Flush DNS
echo -------------------
echo:
ipconfig /flushdns
echo.
echo ----------------------
echo Step 3/6: Register DNS
echo ----------------------
echo:
ipconfig /registerdns
echo.
echo ------------------------
echo Step 4/6: Release Config
echo ------------------------
echo:
ipconfig /release
echo.
echo ----------------------
echo Step 5/6: Renew Config
echo ----------------------
echo:
ipconfig /renew
echo.
echo --------------------------
echo Step 6/6: Reset Web Socket
echo --------------------------
echo:
netsh winsock reset
echo.
cls
echo.
echo  Gaming Optimiser
echo  By: Edward Deakin
echo  https://edward.ml
echo.
echo The optimisation process has now completed!
echo We HIGHLY RECOMEND you RESTART your computer
echo to see the changes in latency.
echo.
echo If you have any issues feel free to contact me
echo via Discord:
echo https://discord.com/users/361479100004564995
echo.
echo Thank you for using my script!
echo Press any key to exit.
echo.
pause >nul
exit