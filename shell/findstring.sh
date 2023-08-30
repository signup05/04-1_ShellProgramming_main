#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi
pattern=$1
file1=$2

grep $pattern $file1 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "[  OK  ] 패턴을 찾았다."
else
    echo "[ FAIL ] 패턴을 찾지 못했다."
fi