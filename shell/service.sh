#!/bin/bash

. /root/shell/functions.sh

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <UNIT> start|stop|restart" && exit 1
fi
srv=$1
action=$2

case $action in
    start|restart) servicestart $srv ;;
    stop|disable)  servicestop $srv  ;;
    *) echo "Usage: $0 <UNIT> start|stop|restart" && exit 2
        ;;
esac