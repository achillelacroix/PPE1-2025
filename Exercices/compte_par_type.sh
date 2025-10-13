#!/usr/bin/bash

TYPE=$1
ANNEE=$2

if [ ! $# -eq 2 ]; then
    echo "Vous devez donner 2 arguments"
    exit
elif [[ ! $2 =~ ^[0-9] ]]; then
    echo "L'argument 2 doit être une année"
    exit
fi

echo "Nombre d'annotations $TYPE en $ANNEE :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/$ANNEE/*/* | grep $TYPE | wc -l
