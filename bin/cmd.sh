#!/bin/bash
# ex) # cmd.sh CMD
#       -> ssh HostIP CMD
if [ $# -eq 0 ]; then
    echo "Usage: $0 CMD"
    exit 1
fi
CMDS=$*

SERVERLIST=/root/bin/server.list
for HOST in $(cat $SERVERLIST)
do
    ping -c 1 -W 1 $HOST >/dev/null 2>&1
    if [ $? -eq 0 ]; then
    echo "----- $HOST -----"
    ssh $HOST $CMDS
    echo
    fi
done
