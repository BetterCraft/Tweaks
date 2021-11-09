@echo off
powershell Invoke-WebRequest "https://github.com/healer-op/HealCloud/blob/main/TweakRaw/powerplan.pow?raw=true" -OutFile "%temp%\BetterCraft_Plan.pow"
powercfg -import "%temp%\BetterCraft_Plan_Plan.pow" 44444444-4444-4444-4444-444444444448
powercfg -SETACTIVE "44444444-4444-4444-4444-444444444448"
powercfg /changename 44444444-4444-4444-4444-444444444448 "BetterCraft_Plan Ultimate Power Plan" "The Ultimate Power Plan to reduce latency and boost FPS."
goto success

:success
SET msgboxTitle=Success
SET msgboxBody=The Power Plan has been imported and activated!
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"





