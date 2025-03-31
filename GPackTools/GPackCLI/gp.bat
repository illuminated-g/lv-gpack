@echo off

echo Starting GPack...

FOR /F "tokens=*" %%g IN ('where %0') do (SET gpack=%%g\..\bin\gp.exe)

echo GPack path: %gpack%
echo Working folder: %cd%
echo args: %*

start "" /b /wait "%gpack%" "%cd%" %*
