#!/bin/bash
# ex) # move_filename2.sh /test
#       -> *.els => *.txt

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

D_WOKR=$1
SRC_PATTERN='.els'
DST_PATTERN='.txt'
T_FILE1=/tmp/.tmp1

ls -1 $D_WORK | grep "${SRC_PATTERN}$" > $T_FILE1
for FILE in `cat $T_FILE1`
do
    mv $D_WOKR/$FILE `echo  $D_WOKR/$FILE | sed "s/${SRC_PATTERN}$/${DST_PATTERN}/g"`
done