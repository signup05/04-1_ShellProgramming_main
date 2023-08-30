#!/bin/bash

Error() {
    echo "FAIL"
    exit 1
}

echo -n "Enter A : "
read a
echo -n "Enter OP : "
read op
echo -n "Enter B : "
read b
case $op in
    '+') echo "$a + $b = $(expr $a + $b)" ;;
    '-') echo "$a - $b = $(expr $a - $b)" ;;
    '*') echo "$a * $b = $(expr $a \* $b)" ;;
    '/') echo "$a / $b = $(expr $a / $b)" ;;
    *) Error ;;
esac