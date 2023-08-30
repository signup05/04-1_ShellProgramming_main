#!/bin/bash
# # cat /etc/hosts
# 192.168.10.10 linux10.example.com linux10
# 192.168.10.11 linux11.example.com linux11
# 192.168.10.12 linux12.example.com linux12
# ...
# 192.168.10.50 linux50.example.com linux50

# hosts=/etc/hosts
hosts=hosts
#> $hosts
net=192.168.10

cat << EOF >> $hosts
#
# Linux Server list
# 
EOF
for i in $(seq 11 50)
do 
    echo "$net.$i  linux$i.example.com  linux$i" >> $hosts
done