#!/bin/bash

echo -n "당신의 선택은? (yes/no): "
read choice

case $choice in
    yes | Y | YES | Yes | y) echo "[ YES ]" ;;
    no  | N |  NO | No  | n) echo "[ NO ]" ;;
    *) echo "[ FAIL ]"
        exit 1 ;;
esac