#!/usr/bin/bash

DATADIR=$1
TYPE=$2
ANNEE=$3

if [ ! $# -eq 3 ]; then
    echo "Vous devez donner 3 arguments"
    exit
elif [[ ! $3 =~ ^[0-9] ]]; then
    echo "L'argument 3 doit être une année"
    exit
fi


cd $DATADIR
cat "./$ANNEE/"*/* | grep "$TYPE" | wc -l
