#!/usr/bin/bash

DATADIR=$1
TYPE=$2


if [ ! $# -eq 2 ]; then
    echo "Vous devez donner 2 arguments"
    exit 1
elif [ ! -d $DATADIR ]; then
    echo "L'argument 1 doit être le chemin d'accès à vos fichiers annotés"
    exit 1
fi

echo "Nombre d'annotations $TYPE en 2016 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2016
echo "Nombre d'annotations $TYPE en 2017 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2017
echo "Nombre d'annotations $TYPE en 2018 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2018
