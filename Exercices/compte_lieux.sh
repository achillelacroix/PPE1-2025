#!/usr/bin/bash

DATADIR=$1
ANNEE=$2
MOIS=$3
NB_LIEUX=$4

if [ $# -ne 4 ]; then
    echo "Vous devez donner 4 arguments"
    exit 1
elif [ ! -d $DATADIR ]; then
    echo "$DATADIR n'est pas un dossier valide"
    exit 1
elif [ ! -d $DATADIR/$ANNEE ]; then
    echo "$DATADIR n'est probablement pas le bon dossier"
    exit 1
#elif [[ ! $2 =~ ^[0-9] ]]; then
#    echo "L'argument 2 doit être une année"
#    exit
#elif [[ ! $3 =~ ^[0-9] ]]; then
#    echo "L'argument 2 doit être le numéro d'un mois"
#    exit
elif [[ ! $4 =~ ^[0-9] ]]; then
    echo "L'argument 1 doit être le nombre de lieux que vous souhaitez afficher"
    exit 1
fi

echo "Les $NB_LIEUX lieux les plus cités en $MOIS $ANNEE sont :"

cat "$DATADIR"/$ANNEE/$MOIS/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NB_LIEUX
