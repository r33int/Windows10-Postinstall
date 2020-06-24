@echo off
CD /D "%~dp0"
REM Xbox Game Bar calls amebarpresencewrite.exe automatically, this script can disable it once and for all.
REM Source & Credit for NSudo: https://github.com/M2Team/NSudo
set nscexe="%CD%\nsudoc.exe"
if NOT exist %nscexe% echo nsudoc.exe was not found. & echo. & echo Press any key to exit . . . & pause >nul & exit
goto checkadmin

:checkadmin
echo Elevating to Administrator permissions . . . 
echo.
NET FILE>nul 2>&1||goto elevate
goto elevated

:elevate
echo.CreateObject^("Shell.Application"^).ShellExecute%0,,,"RunAs",1 >"%CD%\runas.vbs"
cscript //Nologo "%CD%\runas.vbs" >nul
del /q "%CD%\runas.vbs"
exit

:elevated
NET FILE>nul 2>&1||exit
echo Elevating to TrustedInstaller permissions . . . 
echo.
whoami /groups | find /C "TrustedInstaller" >nul
if %ERRORLEVEL% EQU 0 goto start
%nscexe% -U:T -P:E %0
exit

:start
REM To re-enable the process, run the script again but change the 0 to 1!
REM DO NOT use this (it will break too much) tenforums.com/gaming/86858-how-remove-gaming-settings.html
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d 0 /f
echo.
echo Press any key to exit . . . 
pause >nul
exit