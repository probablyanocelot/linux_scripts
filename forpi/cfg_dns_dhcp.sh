#!/bin/sh
# five

echo 'DONE cfg_dns_dhcp NEXT cfg_wifi' >> ./log.txt

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
> /etc/dnsmasq.conf
echo 'interface=wlan0
dhcp-range=192.168.100.2,192.168.100.255,255.255.255.0,24h' >> /etc/dnsmasq.conf