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
