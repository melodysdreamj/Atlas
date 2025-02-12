@echo off
setlocal EnableDelayedExpansion

whoami /user | find /i "S-1-5-18" > nul 2>&1 || (
	call RunAsTI.cmd "%~f0" "%*"
	exit /b
)

call setSvc.cmd netprofm 3
call setSvc.cmd NlaSvc 2
call setSvc.cmd WlanSvc 2
call setSvc.cmd vwififlt 1
call setSvc.cmd eventlog 2

cls & echo Finished, please reboot your device for changes to apply.
pause
exit /b