#!/bin/bash

: << EOF
if [ $# -ne 2 ] ; then
    echo "Usage: $0 <UNIT> start|stop|restart"
    exit 1
fi
EOF

servicestart(){
    service=$1
    systemctl enable $service >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[ OK ] $service enabled."
    else
        echo "[ FAIL ] $service not enabled."
    fi
    systemctl start $service >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[ OK ] $service started."
    else
        echo "[ FAIL ] $service not started."
    fi
}

servicestop(){
    service=$1
    systemctl enable $service >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[ OK ] $service stoped."
    else
        echo "[ FAIL ] $service not stoped."
    fi
    systemctl start $service >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[ OK ] $service disabled."
    else
        echo "[ FAIL ] $service not disabled."
    fi
}

Eval() {
NUMBER=$1
MESSAGE=$2

ON=no
while [ "$ON" = 'no' ] 
do
    echo -n "$NUMBER. $MESSAGE (0점 ~ 100점): "
    read point1
    echo
    echo "당신이 입력한 점수 - $point1"
    echo
 

    echo -n "입력하신 점수가 맞나요 (yes/no): "
    read pointyes
    echo

    case $pointyes in
        yes|YES|y|Y|Yes)
            ON=yes 
            echo "$NUMBER: $point1" >> $RESULT
            ;;
        no|NO|n|NO|No) ON=no ;;
        *) echo "잘못 입력했습니다. yes or no 만 입력해 주세요."
            ON=no ;;
    esac
done
}