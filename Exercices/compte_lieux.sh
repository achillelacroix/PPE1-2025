#!/usr/bin/bash

DATADIR=$1
ANNEE=$2
MOIS=$3
NB_LIEUX=$4

if [ ! $# -eq 4 ]; then
    echo "Vous devez donner 4 arguments"
    exit
#elif [[ ! $2 =~ ^[0-9] ]]; then
#    echo "L'argument 2 doit être une année"
#    exit
#elif [[ ! $3 =~ ^[0-9] ]]; then
#    echo "L'argument 2 doit être le numéro d'un mois"
#    exit
elif [[ ! $4 =~ ^[0-9] ]]; then
    echo "L'argument 1 doit être le nombre de lieux que vous souhaitez d'affiché"
    exit
fi

echo "Les $NB_LIEUX lieux les plus cités en $MOIS $ANNEE sont :"

cat "$DATADIR"/$ANNEE/$MOIS/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NB_LIEUX
