#!/usr/bin/bash

echo "Argument donné : $1"

DATADIR=$1
if [ ! $# -eq 1 ]; then
    echo "Vous devez donner 1 argument"
    exit 1
elif [ ! -d $DATADIR ]; then
    echo "L'argument 1 doit être le chemin d'accès à vos fichiers annotés"
    exit 1
fi

cd $DATADIR

echo "Nombre de lieux en 2016 :"
cat "./2016/"*/* | grep Location | wc -l
echo "Nombre de lieux en 2017 :"
cat "./2017/"*/* | grep Location | wc -l
echo "Nombre de lieux en 2018 :"
cat "./2018/"*/* | grep Location | wc -l
