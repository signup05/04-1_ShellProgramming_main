#!/bin/bash
# 강의 평가
# 1. 강의 환경에 만족하나요? (0~ 100)
# 2. 강의 내용에 만족하나요? (0~ 100)
# 3. 강의 지원에 만족하나요? (0~ 100)

# importing functions.sh import
. /root/shell/functions.sh

# Variable Definition
MESSFILE=/root/shell/MESS.txt
RESULT=result.txt
> $RESULT
NUM=0

# Code Definition
for i in $(seq 3)
do
    NUM=$i
    MESS=$(sed -n "$i"p $MESSFILE)
    Eval "$NUM" "$MESS"
done

echo
cat $RESULT