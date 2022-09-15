#!/bin/sh
# four

echo 'DONE cfg_masq NEXT cfg_dns_dhcp' >> ./log.txt

# forward packets in all directions
sudo /bin/su -c "> /etc/sysctl.d/routed-ap.conf"
sudo /bin/su -c "echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.d/routed-ap.conf"

sudo iptables -A FORWARD -i wlan0 -j ACCEPT \
sudo iptables -A FORWARD -o wlan0 -j ACCEPT \
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

sudo iptables -L
sudo iptables -t nat -L
sudo netfilter-persistent save
