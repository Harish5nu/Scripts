import os
import random
import re

def random_mac():
    return "02:%02x:%02x:%02x:%02x:%02x" % (
        random.randint(0, 255),
        random.randint(0, 255),
        random.randint(0, 255),
        random.randint(0, 255),
        random.randint(0, 255),
    )

def change_mac(interface, new_mac):
    os.system(f"sudo ifconfig {interface} down")
    os.system(f"sudo ifconfig {interface} hw ether {new_mac}")
    os.system(f"sudo ifconfig {interface} up")
    print(f"[+] MAC Address changed to: {new_mac}")

interface = input("Enter Network interface (e.g., eth0, wlan0): ")
new_mac = random_mac()
change_mac(interface, new_mac)
