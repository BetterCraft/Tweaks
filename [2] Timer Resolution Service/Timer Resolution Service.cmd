@echo off

:bcdedits
TITLE BetterCraft | Tweaking BCD...
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
goto redists

:redists
TITLE Downloading the Redist Installer...
powershell Invoke-WebRequest "https://github.com/healer-op/HealCloud/blob/main/TweakRaw/VisualCppRedist_AIO_x86_x64.exe?raw=true" -OutFile "%temp%\VisualCppRedist_AIO_x86_x64.exe"
TITLE BetterCraft | Installing the Redists...
%temp%\VisualCppRedist_AIO_x86_x64.exe



:install
TITLE Downloading and installing the Timer Resolution Service...
powershell BetterCraft | Invoke-WebRequest "https://github.com/healer-op/HealCloud/blob/main/TweakRaw/SetTimerResolutionService.exe?raw=true" -OutFile "%temp%\SetTimerResolutionService.exe"
move "%temp%\SetTimerResolutionService.exe" "C:\"
"C:\SetTimerResolutionService.exe" -install
sc start STR
goto success

:success
SET msgboxTitle=Success
SET msgboxBody=The service has been installed and activated.
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
exit