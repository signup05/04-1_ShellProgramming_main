#!/bin/bash
#         *
#       * * *
#     * * * * *
#   * * * * * * *
# * * * * * * * * *

q=-1
for i in $(seq 1 5)
do  
    q=$(expr $q + 2)
    for k in $(seq $(expr 5 - $i) -1 1)
    do
        echo -n '  '
    done

    for j in $(seq 1 $q)
    do
        echo -n '* '
    done

    echo
done