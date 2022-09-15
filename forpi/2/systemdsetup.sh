# deinstall classic networking
sudo -Es   # if not already done
systemctl daemon-reload
systemctl disable --now ifupdown dhcpcd dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog
apt --autoremove purge ifupdown dhcpcd dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog
rm -r /etc/network /etc/dhcp

# setup/enable systemd-resolved and systemd-networkd
systemctl disable --now avahi-daemon libnss-mdns
apt --autoremove purge avahi-daemon
apt install libnss-resolve
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
apt-mark hold avahi-daemon dhcpcd dhcpcd5 ifupdown isc-dhcp-client isc-dhcp-common libnss-mdns openresolv raspberrypi-net-mods rsyslog
systemctl enable systemd-networkd.service systemd-resolved.service

sudo -Es   # if not already executed before
cat > /etc/systemd/network/08-wlan0.network <<EOF
[Match]
Name=wlan0
[Network]
Address=192.168.4.1/24
MulticastDNS=yes
# IPMasquerade is doing NAT
IPMasquerade=yes
DHCPServer=yes
[DHCPServer]
DNS=84.200.69.80 1.1.1.1
EOF

cat > /etc/systemd/network/04-eth0.network <<EOF
[Match]
Name=eth0
[Network]
DHCP=yes
EOF