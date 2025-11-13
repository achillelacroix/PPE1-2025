#!/usr/bin/bash
if [ $# -ne 2 ]; then
    echo "Ce programme demande deux arguments : 1 fichier d'entrée contenant des urls et 1 fichier sortie"
    exit 1
fi

FICHIER_URLS=$1
SORTIE=$2

if [ ! -f "$FICHIER_URLS" ]; then
    echo "Ce programme demande un fichier"
    exit 1
fi

NB_LIGNE=0 # on aurait pu mettre lineno

echo -e "\
<html>
    <head>
        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css\"> </link>
        <meta charset=\"UTF-8\">
    </head>
    <body>
        <table class=\"table is-hoverable\">
            <thead>
                <tr>
                    <th>Numéro</th>
                    <th>Adresse</th>
                    <th>CodeHttp</th>
                    <th>UTF8?</th>
                    <th>NbDeMots</th>
                </tr>
            </thead>
            <tbody>" > "$SORTIE"

while read -r LINE ; do
    if [[ $LINE =~ ^https?:// ]]; then

        NB_LIGNE=$(expr $NB_LIGNE + 1)

        CODE_ET_ENCODAGE=$(curl -s -L -i -o ".tmp.txt" -w "%{http_code}\n%{content_type}" "$LINE")

        CODE=$(echo "$CODE_ET_ENCODAGE" | head -n 1)

        if [ $CODE -eq 0 ]; then
            echo -e "\
                <tr class=\"is-warning\">
                    <td>$NB_LIGNE</td>
                    <td>$LINE</td>
                    <td>ERREUR</td>
                    <td>ERREUR</td>
                    <td>ERREUR</td>
                </tr>" >> "$SORTIE"
            continue
        fi

        ENCODAGE=$(echo "$CODE_ET_ENCODAGE" | grep -E -o "charset=.*")

        if [[ "$ENCODAGE" =~ ('UTF-8'|'utf-8') ]]; then
            ENCODAGE_OU_PAS="OUI"
        else
            ENCODAGE_OU_PAS="NON"
        fi

        NB_MOTS=$(cat ".tmp.txt" | lynx -dump -stdin -nolist | wc -w)

        rm ".tmp.txt"

        echo -e "\
                <tr>
                    <td>$NB_LIGNE</td>
                    <td>$LINE</td>
                    <td>$CODE</td>
                    <td>$ENCODAGE_OU_PAS</td>
                    <td>$NB_MOTS</td>
                </tr>" >> "$SORTIE"
fi
done  < "$FICHIER_URLS"

echo -e "\
            </tbody>
        </table>
    </body>
</html>" >> "$SORTIE"
