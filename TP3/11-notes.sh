#!/bin/bash
#NAVETEUR Lucas

if [[ -z $1 ]]; then
    echo "Usage : bash 10-annuaire.sh <option>"
    exit
fi

filename="notes.txt"
touch $filename

while getopts "hl:d:anqp" option
    do
        case $option in
            h)
                echo "--------------- Aide en ligne ----------------"
                echo "   => aide en ligne : liste des commandes avec leur syntaxe (h)"
                echo "   => affichage de la note courante (l) ou de la note x (lx)"
                echo "   => affichage de la note suivante (+ ou Return)"
                echo "   => affichage de la note précédente (-)"
                echo "   => destruction de la note courante (d) ou de la note x (dx)"
                echo "   => ajout d'une note en fin de calepin (a)"
                echo "   => affichage du nombre de notes du calepin (n)"
                echo "   => sortie du programme (q ou Ctrl D)"
                echo "   => affichage du calepin complet (p)"
                echo "   => traitement des notes par contenu (l/exp/ ou d/exp/)"
                echo "   => traitement des notes par intervalles (lx-y ou dx-y)"
                echo "   => etc (selon vos désirs)"
                ;;
            l)
                echo "--------------- Affichage note ----------------"
                echo `grep ^${OPTARG} $filename`
                ;;
            d)
                echo "--------------- Destruction note ----------------"
                echo "removing the note number ${OPTARG}"
                sed '/^${OPTARG}/ d $filename'
                #Réarranger les entier de note après suppression
                ;;
            a)
                echo "--------------- Ajout de note ----------------"
                echo "Quel contenu rajouter ?"
                read to_add
                echo "`wc -l $filename | awk '{ print $1+1 }'` - $to_add" >> $filename
                cat $filename
                ;;
            n)
                echo "--------------- Affichage nombre de notes ----------------"
                echo "Il y a `wc -l $filename | awk '{ print $1 }'` notes dans le fichier"
                ;;
            q)
                echo "--------------- Sortie du programme ----------------"
                exit
                ;;
            p)
                echo "--------------- Affichage des notes ----------------"
                cat $filename
                ;;
        esac
    done