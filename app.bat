@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
powershell "[console]::beep(500,300)"
cls
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto new
if "%version%" == "6.3" goto new
if "%version%" == "6.2" goto old
if "%version%" == "6.1" goto old
if "%version%" == "6.0" goto old
if "%version%" == "0.0" goto old
rem etc etc
endlocal

:new
cls
start %windir%\system32\oobe\msoobe.exe
tasklist /fi "msoobe.exe" /fo csv 2>NUL | find /I "msoobe.exe">NUL
if "%ERRORLEVEL%"=="0" echo OOBE is running in %username%
ping localhost -n 01 >nul

:old
cls
start %windir%\system32\oobe\audit.exe
tasklist /fi "audit.exe" /fo csv 2>NUL | find /I "audit.exe">NUL
if "%ERRORLEVEL%"=="0" echo OOBE is running in %username%
ping localhost -n 01 >nul
