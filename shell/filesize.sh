#!/bin/bash
# ./filesize.sh /etc/hosts

if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi
file1=$1

# echo $file1
filesize=$(wc -c < $file1)
echo $filesize

if [ $filesize -ge 5120 ] ; then
    echo "[ OK ] Big file($filesize bytes)."
else
    echo "[ OK ] Big file($filesize bytes)."
fi