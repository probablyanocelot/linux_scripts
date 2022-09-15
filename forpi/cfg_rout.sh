#!/bin/sh
# three

echo 'DONE cfg_rout NEXT cfg_masq' >> ./log.txt

echo 'Editing /etc/dhcpcd.conf'
echo 'interface wlan0' >> /etc/dhcpcd.conf
echo 'static ip_address=192.168.0.100.1/24' >> /etc/dhcpcd.conf
echo 'nohook wpa_supplicant' >> /etc/dhcpcd.conf
