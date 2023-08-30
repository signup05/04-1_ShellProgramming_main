#!/bin/bash

# Shell Definition
BASEDIR=/test

# Code Definition
if [ -d /test ]; then
    rm -rf $BASEDIR/*
fi

for i in $(seq 1 4)
do
    mkdir -p $BASEDIR/$i
    for j in $(seq 1 4)
    do
        mkdir -p $BASEDIR/$i/$j
    done
done

tree /test