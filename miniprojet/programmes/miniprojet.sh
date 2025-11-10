#!/usr/bin/bash
if [ $# -ne 2 ]; then
    echo "Ce programme demande deux arguments : 1 fichier d'entrée contenant des urls et 1 fichier sortie"
    exit
fi

FICHIER_URLS=$1
SORTIE=$2

if [ ! -f "$FICHIER_URLS" ]; then
    echo "Ce programme demande un fichier"
    exit
fi

NB_LIGNE=0 # on aurait pu mettre lineno

echo -e "<html>" > "$SORTIE"
echo -e "\t<head>Ceci est une entête</head>" >> "$SORTIE"
echo -e "\t<body>" >> "$SORTIE"
echo -e "\t\t<table>" >> "$SORTIE"
echo -e "\t<tr><th>Numéro</th><th>Adresse</th><th>CodeHttp</th><th>UTF8?</th><th>NbDeMots</th></tr>" >> "$SORTIE"

while read -r LINE ; do
    if [[ $LINE =~ ^https?:// ]]; then

        NB_LIGNE=$(expr $NB_LIGNE + 1)

        CODE_ET_ENCODAGE=$(curl -s -L -i -o "tmp.txt" -w "%{http_code}\n%{content_type}" "$LINE")

        CODE=$(echo "$CODE_ET_ENCODAGE" | head -n 1)

        if [ $CODE -eq 0 ]; then
            echo -e "\t<tr>\n<td>$NB_LIGNE</td>\t<td>$LINE</td>\t<td>ERREUR</td>\t<td>ERREUR</td>\t<td>ERREUR</td>\n</tr>" >> "$SORTIE"
            continue
        fi

        ENCODAGE=$(echo "$CODE_ET_ENCODAGE" | grep -E -o "charset=.*")

        if [[ "$ENCODAGE" =~ ('UTF-8'|'utf-8') ]]; then
            ENCODAGE_OU_PAS="OUI"
        else
            ENCODAGE_OU_PAS="NON"
        fi

        NB_MOTS=$(cat "tmp.txt" | lynx -dump -stdin -nolist | wc -w)

        rm "tmp.txt"

        echo -e "\t<tr>\n<td>$NB_LIGNE</td>\t<td>$LINE</td>\t<td>$CODE</td>\t<td>$ENCODAGE_OU_PAS</td>\t<td>$NB_MOTS</td>\n</tr>" >> "$SORTIE"
fi
done  < "$FICHIER_URLS"

echo -e "\t\t</table>" >> "$SORTIE"
echo -e "\t</body>" >> "$SORTIE"
echo -e "</html>" >> "$SORTIE"
