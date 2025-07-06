@echo off

echo Starting GPack...

for /f "delims=" %%a in (' powershell "New-GUID | Select-Object -expandproperty Guid"') do set "logfile=%%a"

set logfile=%temp%\%logfile%.gpack.log

echo Logfile: %logfile%

FOR /F "tokens=*" %%g IN ('where %0') do (SET gpack=%%g\..\bin\gp.exe)

rem echo GPack path: %gpack%
rem echo Working folder: %cd%
rem echo args: %*

start "" /b /wait "%gpack%" "%cd%" "%logfile%" %*

type %logfile%

echo Done
