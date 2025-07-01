@echo off

echo Starting GPack...

FOR /F "tokens=*" %%g IN ('where %0') do (SET gpack=%%g\..\bin\gp.exe)

rem echo GPack path: %gpack%
rem echo Working folder: %cd%
rem echo args: %*

start "" /b /wait "%gpack%" "%cd%" %*
