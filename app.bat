@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
start %windir%\system32\oobe\msoobe.exe
