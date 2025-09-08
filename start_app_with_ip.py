#!/usr/bin/env python3
"""
Enhanced Flask Application Startup Script
Displays network information and provides multiple access options
"""

import socket
import webbrowser
import time
import threading
import subprocess
import platform
import os
from flask import Flask

def get_local_ip():
    """Get the local IP address of the machine"""
    try:
        # Connect to a remote address to determine local IP
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        local_ip = s.getsockname()[0]
        s.close()
        return local_ip
    except:
        return "127.0.0.1"

def get_all_network_info():
    """Get comprehensive network information"""
    try:
        local_ip = get_local_ip()
        hostname = socket.gethostname()
        
        # Get all IP addresses
        all_ips = []
        try:
            for info in socket.getaddrinfo(hostname, None):
                ip = info[4][0]
                if ip not in all_ips and not ip.startswith('127.'):
                    all_ips.append(ip)
        except:
            pass
        
        return {
            'local_ip': local_ip,
            'hostname': hostname,
            'all_ips': all_ips,
            'port': 5000
        }
    except Exception as e:
        return {
            'local_ip': '127.0.0.1',
            'hostname': 'localhost',
            'all_ips': [],
            'port': 5000,
            'error': str(e)
        }

def open_browser_with_delay(url, delay=2):
    """Open browser after a delay to allow Flask to start"""
    time.sleep(delay)
    try:
        webbrowser.open(url)
        print(f"✅ Browser opened: {url}")
    except Exception as e:
        print(f"❌ Could not open browser: {e}")

def display_network_info():
    """Display network information in a formatted way"""
    info = get_all_network_info()
    
    print("=" * 60)
    print("🌐 DOCUMENT MANAGEMENT SYSTEM - NETWORK ACCESS")
    print("=" * 60)
    print()
    print(f"🖥️  Hostname: {info['hostname']}")
    print(f"🔌 Port: {info['port']}")
    print()
    print("📍 ACCESS URLs:")
    print("-" * 40)
    
    # Primary access URL
    primary_url = f"http://{info['local_ip']}:{info['port']}"
    print(f"🌍 Primary: {primary_url}")
    
    # Local access
    local_url = f"http://localhost:{info['port']}"
    print(f"🏠 Local:   {local_url}")
    
    # Alternative IPs
    for ip in info['all_ips']:
        if ip != info['local_ip']:
            alt_url = f"http://{ip}:{info['port']}"
            print(f"🔗 Alt:     {alt_url}")
    
    print()
    print("📱 FOR OTHER DEVICES:")
    print("-" * 40)
    print(f"• Use the Primary URL: {primary_url}")
    print("• Ensure devices are on the same network")
    print("• No additional software needed")
    print()
    print("🔧 TROUBLESHOOTING:")
    print("-" * 40)
    print("• If IP changes frequently, consider setting a static IP")
    print("• Check Windows Firewall settings")
    print("• Ensure port 5000 is not used by another application")
    print()
    print("💡 TIP: Visit /network_info in your browser for detailed network information")
    print("=" * 60)
    print()

def check_port_availability(port=5000):
    """Check if the port is available"""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind(('localhost', port))
            return True
    except OSError:
        return False

def main():
    """Main function to start the Flask application"""
    port = 5000
    
    # Check if port is available
    if not check_port_availability(port):
        print(f"❌ Port {port} is already in use!")
        print("Please stop any other applications using this port.")
        input("Press Enter to exit...")
        return
    
    # Display network information
    display_network_info()
    
    # Get network info for browser opening
    info = get_all_network_info()
    primary_url = f"http://{info['local_ip']}:{port}"
    
    # Start browser opening in a separate thread
    browser_thread = threading.Thread(
        target=open_browser_with_delay, 
        args=(primary_url, 3)
    )
    browser_thread.daemon = True
    browser_thread.start()
    
    print("🚀 Starting Flask application...")
    print("⏳ Please wait while the server initializes...")
    print()
    
    # Import and run the Flask app
    try:
        from app import app
        print("✅ Flask application imported successfully")
        print("🌐 Starting server on all network interfaces...")
        print()
        
        # Run the Flask app
        app.run(host='0.0.0.0', port=port, debug=False, use_reloader=False)
        
    except ImportError as e:
        print(f"❌ Error importing Flask app: {e}")
        print("Make sure app.py is in the same directory as this script.")
        input("Press Enter to exit...")
    except Exception as e:
        print(f"❌ Error starting Flask app: {e}")
        input("Press Enter to exit...")

if __name__ == "__main__":
    main() 