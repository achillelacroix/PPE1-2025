#!/usr/bin/bash

TYPE=$1

echo "Nombre d'annotations $TYPE en 2016 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2016/*/* | grep $TYPE | wc -l
echo "Nombre d'annotations $TYPE en 2017 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2017/*/* | grep $TYPE | wc -l
echo "Nombre d'annotations $TYPE en 2018 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2018/*/* | grep $TYPE | wc -l
