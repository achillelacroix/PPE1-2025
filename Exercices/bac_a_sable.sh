#!/usr/bin/bash

N=0
for ELEMENT in $(ls *.sh)
do
    N=$(expr $N + 1)
    echo "le $N ième élément est $ELEMENT"
done
