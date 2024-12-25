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


echo "[3]: set ssh interactive auth"
sed -i 's/KbdInteractiveAuthentication no/KbdInteractiveAuthentication yes/g' /etc/ssh/sshd_config   
service ssh restart

echo "END - install common - " $IP