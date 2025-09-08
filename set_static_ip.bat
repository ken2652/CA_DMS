@echo off
title Set Static IP Address
color 0A

echo.
echo ========================================
echo   SET STATIC IP ADDRESS
echo   Prevent IP Address Changes
echo ========================================
echo.

echo This will set your IP address to 192.168.1.100
echo so it never changes again.
echo.
echo Your Flask app will always be accessible at:
echo http://192.168.1.100:5000
echo.

echo Current IP Configuration:
ipconfig | findstr "IPv4"
echo.

echo ⚠️  WARNING: This requires Administrator privileges
echo.

set /p choice="Do you want to proceed? (y/N): "

if /i "%choice%"=="y" (
    echo.
    echo 🔄 Running PowerShell script as Administrator...
    echo.
    
    powershell -ExecutionPolicy Bypass -File "set_static_ip.ps1"
    
    if errorlevel 1 (
        echo.
        echo ❌ Failed to set static IP
        echo Please run PowerShell as Administrator manually
        echo.
        echo Manual steps:
        echo 1. Right-click PowerShell
        echo 2. Select "Run as Administrator"
        echo 3. Navigate to this folder
        echo 4. Run: .\set_static_ip.ps1
    ) else (
        echo.
        echo ✅ Static IP set successfully!
        echo.
        echo Your Flask app will now always be at:
        echo http://192.168.1.100:5000
        echo.
        echo 📱 Other devices can access using this URL
    )
) else (
    echo.
    echo ❌ Operation cancelled
    echo.
    echo To set static IP manually:
    echo 1. Open Network Settings
    echo 2. Change adapter options
    echo 3. Set IP to 192.168.1.100
    echo 4. Set gateway to 192.168.1.1
    echo 5. Set DNS to 8.8.8.8
)

echo.
pause 