#!/bin/bash

# hosts=/etc/hosts
hosts=hosts
#> $hosts
net=192.168.10

ip1=$(ip addr show ens33 | grep 'inet ' | awk '{print $2}' | awk -F/ '{print $1}' | awk -F. '{print $4}')
cat << EOF >> $hosts
#
# Linux Server list
# 
EOF
for i in $(seq 11 50)
do 
    [ $i = $ip1 ] && continue
    echo "$net.$i  linux$i.example.com  linux$i" >> $hosts
done