:: turn command outputs off
@echo off

:: remove the history directory (if it exists) in both folders
rmdir .\LPHR_WeatherStationPCB\History\ /s /q
rmdir .\LPEDT_Parts\History\ /s /q

:: prompt user for commit message
set [msg=[""]]

:SETMSG    
set /p "msg=Enter Commit Message: "
IF ["%msg"==""] GOTO SETMSG

:: perform git upload
git add .
git commit -m "%msg"
git push -u origin main