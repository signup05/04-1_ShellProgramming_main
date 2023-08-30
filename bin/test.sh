#!/bin/bash

NUM=0
PER=10

while [ $NUM -le 9 ]
do
    echo -ne "$PER% |"
    PER=`expr $PER + 10`
    NUM=`expr $NUM + 1`
    
    for i in $(seq $NUM)
    do
        echo -ne "="
    done
    if [ $NUM -lt 10 ]; then
        echo -ne '>\n'
    elif [ $NUM -eq 10 ]; then
        echo -ne '| complete \n'
    fi
    sleep 1
done
