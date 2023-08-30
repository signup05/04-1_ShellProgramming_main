#!/bin/bash

: cat << EOF
for LINE in $(cat input.txt)
do
    echo $NUM $ORDER $LINE ; read
done
EOF

# : cat << EOF
cat input.txt | while read NUM ORDER LINE
do 
    echo $NUM $ORDER $LINE ; read
done
# EOF

