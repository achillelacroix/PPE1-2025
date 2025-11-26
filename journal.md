# Journal de bord du projet encadré
## Modification de journal.md
Pour modifier journal.md, j'ai utilisé nano. Ce qui me permet de le modifier depuis la console.

## Travail sur les scripts shell 08/10
Je m'amuse beaucoup mais j'ai du mal à adapter le peu de connaissances que j'ai en programmation python à shell. Actuellement, je me bats avec l'exercice 2.b de la feuille d'exo, il faut classer des lieux en fonction du nombre de fois où ils sont cités mais j'ai encore l'impression d'avoir trop peu d'outils à ma disposition pour y parvenir.

Ca avance, j'ai découvert awk et uniq qui me permettent de faire ce que j'avais en tête, j'ai encore un peu de travail à faire au niveau des arguments et de comment ils s'insèrent dans mes commandes mais je touche au but.

J'arrive à classer de manière correcte les lieux en un mois précis mais je n'arrive pas à accepter l'astérisque comme argument de ma commande.

## Correction des scripts shell 15/10
C'est chouette, j'avais pas grand chose à modifier, juste quelques petits trucs. Et les questions que j'avais ont été éclaircies.

## Description dernière slide
En premier lieu, le script vérifie que l'utilisateurice a bien fourni un argument.
Ensuite, on assigne la valeur de cet argument à la variable FICHIER_URLS. On crée également 2 autres variables OK et NOK auxquelles on assigne la valeur 0.
On arrive maintenant au coeur du programme, une boucle while qui lit les lignes de l'argument fourni par l'utilisateurice. On dirait que le script attend un fichier où chaque ligne correspondrait à une url. Il affiche cette ligne puis à l'aide d'une expression régulière il évalue si cette ligne commence "https://" ou "http://". Si c'est le cas, on ajoute 1 à OK, sinon on ajoute 1 à NOK. On répète jusqu'à être passé sur chaque ligne et on affiche le nombre d'urls valides et le nombre d'urls douteuses. Par contre, je ne suis pas certain de comprendre ce que fait l'avant dernière ligne "done < $FICHIER_URLS". J'ai réécrit le script et elle semble bien être importante puisque sans elle le programme semble bloqué sans afficher quoi que ce soit.

## Cours du 22/10
C'est bon j'ai la réponse à ma question sur "done < $FICHIER_URLS", c'est beaucoup plus clair.
J'ai déjà un peu commencé le miniprojet, je capte la logique et je progresse bien.

## Travail sur le miniprojet 23/10 - 25/10
J'ai fait une première version dont chaque commande fonctionnait assez bien séparément mais quand elles sont exécutées séparément, étant donné que le script repose sur plusieurs curls par url, je me suis retrouvé avec des erreurs 429 assez systématiquement.
J'ai donc du réfléchir à une autre version de mon script qui ne repose que sur un curl par url, ce que j'ai fini par réussir à faire malgré quelques difficultés. Je me suis notamment heurté au problème de cat qui surchargeait la mémoire allouée au script et qui en empêchait l'exécution normale. Je l'utilisais pour donner à d'autres commandes le résultat de mon curl stocké dans une variable, remplacer par un echo m'a permis de contourner le problème.

## Travail sur le miniprojet 2 5/11 - 10/11
Globalement aucun soucis, j'ai corrigé mon script au niveau du wordcount parce que j'avais pas utilisé lynx pour ne compter que les mots de la page. J'ai réussi à transformer ma sortie pour que ce soit du html trop de difficultés.

## Travain sur le miniprojet 3 12/11 - 13/11
Pas de gros problème, j'ai eu un léger souci lié au fonctionnement de echo qui interprétait mal des guillemets que j'ai du ajouter à mon script pour mettre le tableau au style Bulma. J'ai finalement réglé le problème en échappant toutes les guillemets avec le backslash.

## Exo sur la résolution de conflits git 19/11 - 20/11
Aucun souci avec l'exercice, j'ai essayé de faire sans le diapo d'aide mais j'en ai eu besoin à cause d'un doute au niveau de git diff.

## Exo regex avec grep et sed
Repérage des moulins à vent
    avec grep, isoler les lignes contenant les occurrences de moulins : cat pg16066.txt | grep moulins
    avec sed, remplacer toutes les occurrences de “moulins à vent" par
moulins-à-vent (en utilisant un argument ’s/.../.../’) : cat pg16066.txt | grep "moulins à vent" | sed 's/moulins à vent/moulins-à-vent/'

Pseudo-lemmatisation de MANGER
    avec grep, isoler les lignes contenant les occurrences du verbe "manger" quelque
soit sa flexion. cat pg16066.txt | grep "mang" ou cat pg16066.txt | grep -E -o 'mang[a-zé]*'
    avec sed, remplacer toutes ces occurrences par la forme MANGER (en utilisant
un argument ’s/.../.../’) : cat pg16066.txt | grep -E -o 'mang[a-zé]\*' | sed 's/mang[a-zé]\*/MANGER/'
    toujours avec sed, effectuer la même opération mais conserver l’information sur
la flexion qu’on indiquera après MANGER, en la séparant d’un caractère +. par
exemple, “mangeaient" doit devenir “MANGER+eaient" : cat pg16066.txt | grep -E -o 'mang[a-zé]\*' | sed -E 's/(mang)([a-zé]\*)/MANGER+\2/'

