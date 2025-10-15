#!/usr/bin/bash

DATADIR=$1
TYPE=$2
ANNEE=$3

if [ ! $# -eq 3 ]; then
    echo "Vous devez donner 3 arguments"
    exit 1
elif [ ! -d $DATADIR ]; then
    echo "L'argument 1 doit être le chemin d'accès à vos fichiers annotés"
    exit 1
elif [[ ! $3 =~ ^[0-9] ]]; then
    echo "L'argument 3 doit être une année"
    exit 1
fi


cd $DATADIR
cat "./$ANNEE/"*/* | grep "$TYPE" | wc -l
