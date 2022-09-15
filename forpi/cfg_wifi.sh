#!/bin/sh
# six

echo 'DONE cfg_wifi'

echo 'WILL REBOOT AT END OF SCRIPT'

echo 'Unblock WiFi'
sudo rfkill unblock wlan

echo 'Make hostapd file'
#  create hostapd file
sudo /bin/su -c "> /etc/hostapd/hostapd.conf"

# write to hostapd.conf
sudo /bin/su -c "cat <<EOT >> /etc/hostapd/hostapd.conf
country_code=US
interface=wlan0
bridge=br0
ssid=smart_toaster
hw_mode=g
channel=9
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=HappyDonkeyGrass
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOT"

sudo reboot
