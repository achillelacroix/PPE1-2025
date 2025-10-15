#!/usr/bin/bash

DATADIR=$1
TYPE=$2


if [ ! $# -eq 2 ]; then
    echo "Vous devez donner 2 arguments"
    exit
fi

echo "Nombre d'annotations $TYPE en 2016 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2016
echo "Nombre d'annotations $TYPE en 2017 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2017
echo "Nombre d'annotations $TYPE en 2018 :"
bash compte_par_type.sh "$DATADIR" "$TYPE" 2018
