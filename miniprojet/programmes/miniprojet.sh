#!/usr/bin/bash
if [ $# -ne 2 ]; then
    echo "Ce programme demande deux arguments"
    exit
fi

FICHIER_URLS=$1
SORTIE=$2

if [ ! -f "$FICHIER_URLS" ]; then
    echo "Ce programme demande un fichier"
    exit
fi

CONTENU_PAGE=""
NB_LIGNE=0
REPONSE_REQUETE=""
ENCODAGE_OU_PAS=""
NB_MOTS=0

echo -e "Numero\tAdresse\tReponseRequête\tEncodageEnUTF8\tNombreDeMots" > "$SORTIE"

while read -r LINE ; do
    if [[ $LINE =~ ^https?:// ]]; then

        CONTENU_PAGE=$(curl --silent -L -i "$LINE" )

        NB_LIGNE=$(expr $NB_LIGNE + 1)

        REPONSE_REQUETE=$( echo "$CONTENU_PAGE" | head -n 1 | rev | cut -f2 -d " " | rev)

        ENCODAGE=$( echo "$CONTENU_PAGE" | head -n 10 | grep charset | cut -d "=" -f 2)

        if [[ "$ENCODAGE" =~ ('UTF-8'|'utf-8') ]]; then
            ENCODAGE_OU_PAS="OUI"
        else
            ENCODAGE_OU_PAS="NON"
        fi

        NB_MOTS=$( echo "$CONTENU_PAGE" | sed '/<!DOCTYPE html>/,$!d' | wc -w)

        echo -e "$NB_LIGNE\t$LINE\t$REPONSE_REQUETE\t$ENCODAGE_OU_PAS\t$NB_MOTS" >> "$SORTIE"
fi
done  < "$FICHIER_URLS"
