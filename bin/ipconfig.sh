#!/bin/bash

# (1) Host Name
# (2) Connection Name
# (3) Method Check
# (4) Ethernet Adapter
# (5) IPv4 Address
# (6) Default Gateway
# (7) DNS Servers

# (0) Variable definition
export LANG=en_US.UTF-8
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2

# (1) Host Name
HOST=$(hostname)
echo "Host Name ............ : $HOST"

# (2) Connection Name
nmcli -f NAME connection | tail -n +2 > $TMP1
for CON in $(cat $TMP1)
do

# (3) Ethernet Adapter
NIC=$(nmcli connection | grep $CON | awk '{print $4}')

# (4) Method Check
METHOD=$(nmcli connection show $CON | grep "ipv4.method:" | awk '{print $2}')

if [ $METHOD = 'manual' ] ; then
	# (5) IPv4 Address
	IP1=$(nmcli connection show $CON | grep "ipv4.addresses:" | awk '{print $2}')
	# (6) Default Gateway
	GW1=$(nmcli connection show $CON | grep "ipv4.gateway:" | awk '{print $2}')
	# (7) DNS Servers
	DNS1=$(nmcli connection show $CON | grep "ipv4.dns:" | awk '{print $2}')
elif [ $METHOD = 'auto' ] ; then
	# (5) IPv4 Address
	IP1=$(nmcli connection show $CON | fgrep "IP4.ADDRESS[1]:" | awk '{print $2}')
	# (6) Default Gateway
	GW1=$(nmcli connection show $CON | fgrep "IP4.GATEWAY:" | awk '{print $2}')
	# (7) DNS Servers
	DNS1=$(nmcli connection show $CON | fgrep "IP4.DNS[1]:" | awk '{print $2}')
else
	echo "[FAIL] Only 'manual' or 'auto' settings can be checked."
fi
# (8) Output
    cat << EOF

Connection Name ...... : $CON
Ethernet adapter ..... : $NIC
Method ............... : $METHOD
IPv4 Address ......... : $IP1
Default Gateway ...... : $GW1
DNS Servers .......... : $DNS1
EOF

done