#!/usr/bin/bash


ANNEE=$1
MOIS=$2
NB_LIEUX=$3

if [ ! $# -eq 3 ]; then
    echo "Vous devez donner 3 arguments"
    exit
elif [[ ! $1 =~ ^[0-9] ]]; then
    echo "L'argument 1 doit être une année"
    exit
elif [[ ! $2 =~ ^[0-9] ]]; then
    echo "L'argument 2 doit être le numéro d'un mois"
    exit
elif [[ ! $3 =~ ^[0-9] ]]; then
    echo "L'argument 1 doit être le nombre de lieux que vous souhaitez d'affiché"
    exit
fi

echo "Les $NB_LIEUX lieux les plus cités en $MOIS $ANNEE sont :"

cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/$ANNEE/$MOIS/* | grep Location | awk -F'\t' '{print $3}' | sort | uniq -c | sort -gr | head -n $NB_LIEUX
