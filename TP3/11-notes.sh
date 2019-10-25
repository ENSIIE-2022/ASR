#!/bin/bash
#NAVETEUR Lucas

if [[ -z $1 ]]; then
    echo "Usage : bash 10-annuaire.sh <option>"
    exit
fi

filename="notes.txt"
touch $filename

while getopts "hldanqp" option
    do
        echo "getopts a trouvé l'option $option"
        case $option in
            h)
                echo "--------------- Aide en ligne ----------------";;
            l)
                echo "--------------- Affichage note ----------------";;
            d)
                echo "--------------- Destruction note ----------------";;
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