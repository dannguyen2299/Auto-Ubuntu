#!/bin/bash

SSID="ubuntu" # wifi name 
PASSWORD="22031999124" # wifi pass
INTERFACE="wlp4s0" # wifi interface (check: nmcli dev)

if nmcli device status | grep -q "$INTERFACE"; then
    echo "Setting up WiFi hotspot..."
    
    nmcli radio wifi off
    
    nmcli radio wifi on
    
    nmcli device wifi hotspot ifname $INTERFACE ssid $SSID password $PASSWORD
    
    echo "WiFi Hotspot '$SSID' is now active."
else
    echo "WiFi interface '$INTERFACE' not found. Please check your WiFi interface."
    exit 1
fi
