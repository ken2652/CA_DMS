# PowerShell Script to Set Static IP Address
# Run this as Administrator

param(
    [string]$IPAddress = "192.168.1.100",
    [string]$SubnetMask = "255.255.255.0",
    [string]$Gateway = "192.168.1.1",
    [string]$DNS1 = "8.8.8.8",
    [string]$DNS2 = "8.8.4.4"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Static IP Configuration Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ This script must be run as Administrator!" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✅ Running as Administrator" -ForegroundColor Green
Write-Host ""

# Get current network configuration
Write-Host "🔍 Current Network Configuration:" -ForegroundColor Yellow
ipconfig | Select-String "IPv4"

Write-Host ""
Write-Host "📋 Proposed Static IP Configuration:" -ForegroundColor Yellow
Write-Host "IP Address: $IPAddress" -ForegroundColor White
Write-Host "Subnet Mask: $SubnetMask" -ForegroundColor White
Write-Host "Gateway: $Gateway" -ForegroundColor White
Write-Host "DNS 1: $DNS1" -ForegroundColor White
Write-Host "DNS 2: $DNS2" -ForegroundColor White
Write-Host ""

# Get active network adapter
Write-Host "🔍 Finding active network adapter..." -ForegroundColor Yellow
$adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1

if (-not $adapter) {
    Write-Host "❌ No active network adapter found!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✅ Found active adapter: $($adapter.Name)" -ForegroundColor Green
Write-Host ""

# Confirm with user
Write-Host "⚠️  WARNING: This will change your network configuration!" -ForegroundColor Red
Write-Host "Make sure you have the correct gateway IP address." -ForegroundColor Yellow
Write-Host ""
$confirm = Read-Host "Do you want to proceed? (y/N)"

if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "❌ Operation cancelled by user" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 0
}

Write-Host ""
Write-Host "🔄 Setting static IP address..." -ForegroundColor Yellow

try {
    # Remove existing IP configuration
    Remove-NetIPAddress -InterfaceIndex $adapter.ifIndex -Confirm:$false -ErrorAction SilentlyContinue
    
    # Set new static IP
    New-NetIPAddress -InterfaceIndex $adapter.ifIndex -IPAddress $IPAddress -PrefixLength 24 -DefaultGateway $Gateway
    
    # Set DNS servers
    Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $DNS1, $DNS2
    
    Write-Host "✅ Static IP configured successfully!" -ForegroundColor Green
    Write-Host ""
    
    # Test connectivity
    Write-Host "🔍 Testing internet connectivity..." -ForegroundColor Yellow
    $test = Test-NetConnection -ComputerName $DNS1 -Port 53 -InformationLevel Quiet
    
    if ($test) {
        Write-Host "✅ Internet connectivity confirmed!" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Internet connectivity test failed. Check your gateway IP." -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "🎉 Configuration Complete!" -ForegroundColor Green
    Write-Host "Your Flask app will now always be accessible at:" -ForegroundColor White
    Write-Host "http://$IPAddress`:5000" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📱 Other devices can access using the same URL" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host "❌ Error setting static IP: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "🔧 Troubleshooting:" -ForegroundColor Yellow
    Write-Host "1. Check if the IP address is already in use" -ForegroundColor White
    Write-Host "2. Verify your gateway IP address" -ForegroundColor White
    Write-Host "3. Try a different IP address (e.g., 192.168.1.101)" -ForegroundColor White
    Write-Host ""
}

Write-Host "Press Enter to exit..."
Read-Host 