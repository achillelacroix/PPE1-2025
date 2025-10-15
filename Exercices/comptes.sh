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

for ANNEE in 2016 2017 2018
do
    echo "Nombre de lieux en $ANNEE :"
    cat "./$ANNEE/"*/* | grep Location | wc -l
done
