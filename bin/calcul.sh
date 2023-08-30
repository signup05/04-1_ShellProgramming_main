#!/bin/bash

Error() {
    echo "FAIL"
    exit 1
}

echo -n "Enter A : "
read a

echo -n "Enter B : "
read b

echo "$a :  $b"

cat << EOF
(1). +      (2). -      (3). *      (4). /
EOF
echo -n "Enter your choice? (1|2|3|4): "
read choice

case $choice in
    1) echo "$a + $b = $(expr $a + $b)" ;;
    2) echo "$a - $b = $(expr $a - $b)" ;;
    3) echo "$a * $b = $(expr $a \* $b)" ;;
    4) echo "$a / $b = $(expr $a / $b)" ;;
    *) Error ;;
esac