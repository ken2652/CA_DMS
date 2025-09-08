@echo off
echo ========================================
echo Static IP Configuration Helper
echo ========================================
echo.
echo This script will help you configure a static IP address
echo to prevent IP changes that affect your Flask application.
echo.
echo Current IP Configuration:
ipconfig /all | findstr "IPv4"
echo.
echo To set a static IP, you need to:
echo 1. Open Network & Internet settings
echo 2. Click on "Change adapter options"
echo 3. Right-click your active network adapter
echo 4. Select "Properties"
echo 5. Select "Internet Protocol Version 4 (TCP/IPv4)"
echo 6. Click "Properties"
echo 7. Select "Use the following IP address"
echo 8. Enter your desired static IP (e.g., 192.168.1.100)
echo 9. Enter Subnet mask: 255.255.255.0
echo 10. Enter Default gateway: (your router IP, usually 192.168.1.1)
echo 11. Enter DNS: 8.8.8.8
echo.
echo After setting static IP, your Flask app will always be accessible
echo at the same IP address from other devices.
echo.
pause 