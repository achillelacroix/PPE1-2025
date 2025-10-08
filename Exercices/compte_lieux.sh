#!/usr/bin/bash

MOIS=$1
ANNEE=$2
NB_LIEUX=$3



echo "Les $NB_LIEUX lieux les plus cités en $ANNEE sont :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/$ANNEE/$MOIS/* | grep Location | awk '{print $5}' | sort

cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2016/1/* | grep Location | awk '{print $5}' | sort
