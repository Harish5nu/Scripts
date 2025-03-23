🛡️ MAC Address Changer (Bash Script)

📜 Description:

This simple Bash script allows you to temporarily change the MAC address of a network interface. It generates a random MAC address for the specified interface, enhancing privacy and useful for penetration testing.


⚙️ Usage:
Clone or Download the Script:
git clone https://github.com/Harish5nu/Scripts.git
cd Scripts


Make the Script Executable:
chmod +x mac_changer.sh


Run the Script:
sudo ./mac_changer.sh <interface>


Example:
sudo ./mac_changer.sh wlan0


Verify the Change:
ip link show wlan0

⚠️ Disclaimer:
For educational and ethical hacking purposes only.

Not for malicious activities.

⭐ If helpful, please give a star!
