#!/bin/sh
# two

echo 'DONE get_pkgs NEXT cfg_rout' >> ./log.txt 

echo 'Start installing & unmask+enabling(hostapd) packages'
sudo apt install hostapd
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo apt install dnsmasq
sudo apt install netfilter-persistent iptables-persistent
echo 'End'
echo 'Reboot'
sudo reboot