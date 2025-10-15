#!/usr/bin/bash

echo "Argument donné : $1"

DATADIR=$1

cd $DATADIR

echo "Nombre de lieux en 2016 :"
cat "./2016/"*/* | grep Location | wc -l
echo "Nombre de lieux en 2017 :"
cat "./2017/"*/* | grep Location | wc -l
echo "Nombre de lieux en 2018 :"
cat "./2018/"*/* | grep Location | wc -l
