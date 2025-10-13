#!/usr/bin/bash

echo "Nombre de lieux en 2016 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2016/*/* | grep Location | wc -l
echo "Nombre de lieux en 2017 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2017/*/* | grep Location | wc -l
echo "Nombre de lieux en 2018 :"
cat /home/al/Documents/M1/S1/Projet_de_programmation_encadré/Exercice1/ann/2018/*/* | grep Location | wc -l
