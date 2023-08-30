#!/bin/bash

#ip1="192.168.10.10"
ip1=""
if [ -z $ip1 ] ; then
    echo "[  OK  ] NULL"
else
    echo "[  NO  ] Not NULL"
fi