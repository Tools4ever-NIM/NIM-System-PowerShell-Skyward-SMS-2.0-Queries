# NIM-System-PowerShell-Skyward-SMS2.0-Queries

![image](https://github.com/Tools4ever-NIM/NIM-System-PowerShell-Skyward-SMS2.0-Queries/assets/24281600/f1f8b6d2-6cf0-4bde-b0e1-837778a72d5b)

NIM Connector for Skyward SMS 2.0

<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Requirements](#Requirements)
* [Sample VPN Scripts](#sample-vpn-scripts)

## Requirements
- Progress OpenEdge Driver 11.7+ (ODBC)
  https://support.skyward.com/DeptDocs/Corporate/IT%20Services/Public%20Website/Technical%20Information/PaCInstallDocs/Skyward%20ODBC%20Launch%20Kit.pdf

## Sample VPN Scripts
### Open VPN
```
cd C:\Tools4ever\Scripts
taskkill /S localhost /im vpncli.exe /f /t
taskkill /S localhost /im vpnui.exe /f /t
"c:\program files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe" -s < connect.txt
```
### Close VPN
```
cd C:\Tools4ever\Scripts
"c:\program files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe" disconnect
```
### VPN Client Config
```
connect vpn-1.iscorp.com
idofgroup
thisismusername
thisismypassword
y
quit
```
