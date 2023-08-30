#!/bin/bash

. /root/bin/functions.sh

IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com

# 네트워크 점검 스크립트
# 1) ping 192.168.10.2

print_info "1) ping $IP1"
ping -c 1 -W 1 $IP1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] Local Network Connection "
else
    print_error "[ FAIL ] DNS Client Configuration"
    cat << EOF
    (a) # ip addr, ifconfig
    (b) VMWare > Edit > Virtual Network Editor > VMnet0
    (c) VMWare > Edit > Virtual Network Editor > VMnet8
        * Network number
        * Gateway IP address
    (d) (win)services.msc > VMware* 서비스 동작
EOF
fi


# 2) ping 8.8.8.8
print_info "2) ping $IP2"
ping -c 1 -W 1 $IP2 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] External Network Connection "
else
    print_error "[ FAIL ] External Client Configuration"
    cat << EOF
    (a) # ip route (# netstat -nr, # route -n)
EOF
fi

# 3) ping www.google.com
print_info "3) dig $IP3"
# ping -c 1 -W -1 www.google.com >/dev/null 2>&1
dig +noanswer +timeout=1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    print_good "[  OK  ] DNS Clinet Connection "
else
    print_error "[ FAIL ] DNS Clinet Configuration"
    cat << EOF
    (a) # cat /etc/resolv.conf
EOF
fi