#!/bin/bash
#         *
#       * * *
#     * * * * *
#   * * * * * * *
# * * * * * * * * *

for i in $(seq 1 5)
do
    for k in $(seq $(expr 5 - $i) -1 1)
    do
        echo -n '  '
    done

    for j in $(seq 1 $i)
    do
        echo -n '* '
    done

    for q in $(seq 2 $i)
    do
        echo -n '* '
    done

    echo
done

for i in $(seq 1 4)
do
    for k in $(seq 1 $i)
    do
        echo -n '  '
    done

    for j in $(seq 1 $(expr 5 - $i))
    do
        echo -n '* '
    done

    for q in $(seq $i 3)
    do
        echo -n '* '
    done
    echo
done