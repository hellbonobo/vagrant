#!/bin/bash

## install prerequisites

HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $2}')
echo "START - install prerequisites - "$IP

echo "[1]: add host name for ip"
host_exist=$(cat /etc/hosts | grep -i "$IP" | wc -l)
if [ "$host_exist" == "0" ];then
echo "$IP $HOSTNAME " >/etc/hosts
fi

echo "[2]: setup keyboard"
sudo setxkbmap fr
sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"fr\"/g' /etc/default/keyboard

echo "END - install common - " $IP



