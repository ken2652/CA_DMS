# 🔒 Set Static IP Address - Never Change Again!

## 🎯 Goal: Make Your IP Address Permanent
Your current IP: **192.168.1.19**  
Target static IP: **192.168.1.100** (recommended)

---

## 📋 Step-by-Step Instructions

### Step 1: Open Network Settings
1. Press **Windows Key + I** to open Settings
2. Click **Network & Internet**
3. Click **Change adapter options** (on the right side)

### Step 2: Find Your Network Adapter
1. You'll see network adapters (Wi-Fi, Ethernet, etc.)
2. **Right-click** on your active adapter (the one that's connected)
3. Select **Properties**

### Step 3: Configure IPv4
1. In the Properties window, find **Internet Protocol Version 4 (TCP/IPv4)**
2. **Select it** (click on it once)
3. Click **Properties** button

### Step 4: Set Static IP
1. Select **"Use the following IP address"**
2. Enter these values:
   - **IP address**: `192.168.1.100`
   - **Subnet mask**: `255.255.255.0`
   - **Default gateway**: `192.168.1.1`
3. Select **"Use the following DNS server addresses"**
4. Enter:
   - **Preferred DNS server**: `8.8.8.8`
   - **Alternate DNS server**: `8.8.4.4`
5. Click **OK** to save

### Step 5: Verify Settings
1. Click **OK** on all windows
2. Test your internet connection
3. Your Flask app will now always be at: **http://192.168.1.100:5000**

---

## 🔧 Alternative: Use Your Current IP as Static

If you prefer to keep your current IP (`192.168.1.19`):

1. Follow steps 1-3 above
2. In Step 4, use these values:
   - **IP address**: `192.168.1.19` (your current IP)
   - **Subnet mask**: `255.255.255.0`
   - **Default gateway**: `192.168.1.1`
   - **DNS**: `8.8.8.8`

---

## ✅ Benefits of Static IP

- ✅ **Never changes** - same address every time
- ✅ **Consistent access** - other devices always use same URL
- ✅ **Professional setup** - ideal for production
- ✅ **No more IP confusion** - always know your address

---

## 🚀 After Setting Static IP

### Your Flask App Will Always Be At:
```
http://192.168.1.100:5000
```

### For Other Devices:
- **Phones**: Use the URL above
- **Tablets**: Use the URL above  
- **Other computers**: Use the URL above
- **No installation needed** on client devices

---

## 🔧 Troubleshooting

### If Internet Doesn't Work:
1. **Check Gateway**: Make sure default gateway is correct (usually `192.168.1.1`)
2. **Check DNS**: Try `8.8.8.8` and `8.8.4.4`
3. **Router IP**: Your router IP is usually `192.168.1.1`

### If IP Conflict:
1. Try a different IP like `192.168.1.101`
2. Or check what IPs are in use on your network

### To Revert to DHCP:
1. Go back to network settings
2. Select **"Obtain an IP address automatically"**
3. Select **"Obtain DNS server address automatically"**

---

## 📱 Test Your Setup

### 1. Start Your Flask App:
```bash
python start_app_with_ip.py
```

### 2. Access from Different Devices:
- **Same computer**: `http://localhost:5000`
- **Other devices**: `http://192.168.1.100:5000`

### 3. Verify It Works:
- Try accessing from your phone
- Try accessing from another computer
- The IP should never change now!

---

## 🎉 Success!

Once you've set the static IP:
- Your IP address will **never change**
- Your Flask app will always be accessible at the same URL
- Other devices can bookmark the URL permanently
- No more IP address confusion!

---

## 📞 Need Help?

If you have trouble:
1. **Check your router IP** - usually `192.168.1.1`
2. **Try different IP** - like `192.168.1.101`
3. **Check network range** - make sure you're using `192.168.1.x`

**Your Flask app will be permanently accessible at the static IP you choose!** 