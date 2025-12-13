@echo off
:: Launch PowerShell with elevation and run the script
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"C:\path\to\toggle_touchscreen.ps1\"'"

:: Wait for user input before closing
echo.
echo Press any key to exit...
pause >nul