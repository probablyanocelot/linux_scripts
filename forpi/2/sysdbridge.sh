sudo -Es   # if not already executed before
cat > /etc/systemd/network/02-br0.netdev <<EOT
[NetDev]
Name=br0
Kind=bridge
EOT

cat > /etc/systemd/network/04-br0_add-eth0.network <<EOT
[Match]
Name=eth0
[Network]
Bridge=br0
EOT

cat > /etc/systemd/network/12-br0_up.network <<EOT
[Match]
Name=br0
[Network]
MulticastDNS=yes
DHCP=yes
# to use static IP uncomment these and comment DHCP=yes
#Address=192.168.50.60/24
#Gateway=192.168.50.1
#DNS=84.200.69.80 1.1.1.1
EOT

sudo /bin/su -c "cat <<EOT >> wpa_supplicant@wlan0.service

[Service]
ExecStartPre=/sbin/iw dev %i set type __ap
ExecStartPre=/bin/ip link set %i master br0

ExecStart=
ExecStart=/sbin/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-%I.conf -Dnl80211,wext -i%I -bbr0

ExecStopPost=-/bin/ip link set %i nomaster
ExecStopPost=-/sbin/iw dev %i set type managed
EOT"