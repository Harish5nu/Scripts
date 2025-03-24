#!/bin/bash

# Check for the root privilege
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Check if interface is provided
if [ -z "$1" ]; then
    echo "Usage: ./mac_changer.sh <interface>"
    exit 1
fi

INTERFACE=$1

echo "[*] Current MAC Address:"
ip link show $INTERFACE | grep "link/ether" | awk '{print $2}'

# Bring the interface down
echo "[*] Turning off $INTERFACE"
ip link set $INTERFACE down

# Generate a random MAC address
NEW_MAC=$(printf '02:%02X:%02X:%02X:%02X:%02X' $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM)

# Change MAC address
echo "[*] Changing MAC Address to $NEW_MAC"
ip link set dev $INTERFACE address $NEW_MAC

# Bring the interface back up
ip link set $INTERFACE up

echo "[*] MAC Address changed successfully!"
ip link show $INTERFACE | grep "link/ether" | awk '{print $2}'
