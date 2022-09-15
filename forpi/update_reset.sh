#!/bin/sh
# one

echo 'DONE update_reset NEXT get_pkgs' >> ./log.txt

echo 'Update & Reboot'
sudo apt update
sudo apt upgrade
sudo reboot