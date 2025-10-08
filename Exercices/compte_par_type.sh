#!/usr/bin/bash

TYPE=$1
ANNEE=$2

echo "Nombre d'annotations $TYPE en $ANNEE :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/$ANNEE/*/* | grep $TYPE | wc -l
