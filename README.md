# 🔧 IT Troubleshooting Toolbox

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows-0078D4.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Scripts](https://img.shields.io/badge/scripts-20+-success.svg)

**One-click PowerShell solutions for common Windows IT issues**

</div>

---

## 📋 Overview

Free Windows IT troubleshooting scripts with one-click fixes for network, DNS, printers, disk, users, and more. Perfect for help desk, tech support, system administrators, and IT professionals who need quick, reliable solutions.

## 🚀 Quick Start

### How to Use

**Method 1: Right-Click (Easiest)**
1. Download any `.ps1` script
2. Right-click and choose **Run with PowerShell**
3. Click "Yes" if prompted

**Method 2: Command Line**
```powershell
powershell.exe -ExecutionPolicy Bypass -File .\ScriptName.ps1
```

**No installation needed. Just download, right-click, and run!**

## 🛠️ Tools Included

### 🌐 Network Tools
- `Flush_DNS.ps1` — Clear DNS cache (fixes website loading issues)
- `Restart_Network_Adapter.ps1` — Restart network connection
- `Check_Internet_Connection.ps1` — Test internet connectivity
- `Show_My_IP_Address.ps1` — Display IP address and network info

### 💾 Disk & Storage
- `Clear_Temp_Files.ps1` — Delete temporary files, free up space
- `Show_Disk_Space.ps1` — Show free space on all drives
- `Find_Large_Files.ps1` — Find largest files in any folder
- `Recently_Modified_Files.ps1` — Find files changed in last 48 hours

### 🖨️ Printer Support
- `Restart_Print_Spooler.ps1` — Fix printer issues and stuck print jobs

### 👥 User Management
- `List_Local_Users.ps1` — List all local user accounts
- `List_Local_Admins.ps1` — List all local administrators

### 📊 System Information
- `Show_Installed_Programs.ps1` — List all installed programs
- `System_Resource_Monitor.ps1` — Monitor CPU and RAM usage in real-time
- `Show_System_Uptime.ps1` — Display system uptime
- `Advanced_System_Info.ps1` — Comprehensive system details

### 🔍 Diagnostics
- `Show_Event_Log_Errors.ps1` — Show recent error events
- `List_Startup_Programs.ps1` — Show programs that run at startup
- `Check_Windows_Updates.ps1` — Check for pending Windows updates

### 🔒 Security
- `Firewall_Quick_Toggle.ps1` — Enable/disable Windows Firewall

### 🎯 All-in-One
- `IT_Troubleshooting_Toolbox.ps1` — Interactive menu with all tools

## 💡 Common Scenarios

### "Internet Not Working"
```powershell
.\Check_Internet_Connection.ps1  # Test connectivity
.\Flush_DNS.ps1                   # Clear DNS cache
.\Restart_Network_Adapter.ps1     # Restart network
```

### "Computer Running Slow"
```powershell
.\System_Resource_Monitor.ps1     # Check CPU/RAM
.\List_Startup_Programs.ps1       # Check startup items
.\Clear_Temp_Files.ps1            # Free up space
```

### "Printer Not Working"
```powershell
.\Restart_Print_Spooler.ps1       # Restart print service
```

## 📋 Requirements

- Windows 10/11 or Windows Server 2016+
- PowerShell 5.1+ (pre-installed on modern Windows)
- Administrator rights (for most scripts)

## 🤝 Contributing

Contributions welcome! Fork the repo, add your script, and submit a pull request.

## 📝 License

MIT License - Free to use, modify, and distribute.

---

<div align="center">

**Making IT troubleshooting faster and easier**

⭐ Star this repo if it helps you!

Need help? Open an issue or check the scripts for comments.

</div>
