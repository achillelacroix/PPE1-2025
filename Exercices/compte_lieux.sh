#!/usr/bin/bash

MOIS=$1
ANNEE=$2
NB_LIEUX=$3

echo "Les $NB_LIEUX lieux les plus cités en $MOIS $ANNEE sont :"

cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/$ANNEE/$MOIS/* | grep Location | awk -F'\t' '{print $3}' | sort | uniq -c | sort -gr | head -n $NB_LIEUX


# uniq -c pr compter les occurences d'unités suppr
