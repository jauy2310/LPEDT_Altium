:: turn console feedback off
@echo off

:: remove the history directory (if it exists) in both folders
rmdir .\LPHR_WeatherStationPCB\History\ /s /q
rmdir .\LPEDT_Parts\History\ /s /q

:: prompt user for input
:input_message
set /p commit_message=Enter your commit message:

if "%commit_message%"=="" (
    echo Commit message cannot be empty. Please try again.
    goto input_message
)

:: perform git upload
git add .
git commit -m "%commit_message%"
git push -u origin main

echo.
echo.
echo Commit Successful!