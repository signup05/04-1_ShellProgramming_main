#!/bin/bash
# ex) # move_filename.sh

D_WOKR=/test
T_FILE1=/tmp/.tmp1

ls -1 $D_WORK | grep '.txt$' > $T_FILE1
for FILE in `cat $T_FILE1`
do
    mv $D_WOKR/$FILE `echo  $D_WOKR/$FILE | sed 's/.txt$/.els/g'`
done