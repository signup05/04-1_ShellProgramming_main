#!/bin/bash

echo -n "파일 입력: "
read file1

# echo $file1
if [ -d $file1 ] ; then
    echo "[ Dir ] file is directory file"
elif [ -f $file1 ] ; then
    echo "[ Regular ] file is regular file"
else
    echo "[ FAIL ] Not exist file name"
fi