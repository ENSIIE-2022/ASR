#!/bin/bash
#NAVETEUR Lucas

#Format de la date sans les 0 au début pour les jours : 7 02 1998

check_date() {
    #On prend la ligne contenant notre jours précis
    days=`cal $2 $3 | grep $1`
    #Pour i allant de 1 à 7 (Jours de la semaine)
    for i in 1 2 3 4 5 6 7;
        do
            #On prend chaque élément de la ligne
            day=`echo $days | cut -d' ' -f$i`
            #On regarde si cet élément est égal à la date recherchée 
            if [[ $day = $1 ]]; then
                #Si la date est trouvée, on étudie $i pour trouver le jour, Attention la semaine commence par dimanche avec cal
                case $i in
                    1)   echo "Tu es né un Dimanche";;
                    2)   echo "Tu es né un Lundi";;
                    3)   echo "Tu es né un Mardi";;
                    4)   echo "Tu es né un Mercredi";;
                    5)   echo "Tu es né un Jeudi";;
                    6)   echo "Tu es né un Vendredi";;
                    7)   echo "Tu es né un Samedi";;
                esac
            fi
        done
}

if [ -z $3 ]; then
    echo "Usage : bash 09-weekday.sh <jour> <mois> <annee>"
fi
check_date $1 $2 $3