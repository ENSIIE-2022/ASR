#!/bin/bash
#NAVETEUR Lucas

argument=$1
if [ -z $1 ]; then
    echo "Usage : bash 02-which.sh <command_name>"
    exit
fi
#On crée une variable chemins pour ne pas écraser par erreur la variable PATH
chemins=$PATH
#La première clef commence à 1 pour cut
i=1
#On prépare un cut de la variable chemins (PATH) pour obtenir toutes les parties entre les délimiteurs ':'
res=`echo $chemins | cut -d':' -f$i`

#Tant que la partie de chemin n'est pas nulle
while [ ! -z $res ]
  do
    #On incrémente la clef de 1 pour prendre la partie de PATH suivante
    i=$((i+1))
    #On utilise un find pour trouver la commande dans les differents répertoires
    find_res=`find $res -name $argument 2>/dev/null -print -quit`
    #Si la commande find n'est pas vide, c'est qu'elle à trouver un répertoire dans lequel se trouve la commande
    if [ ! -z $find_res ]; then
      #Afficher sur la console le résultat le plus rapide obtenu par find pour trouver la commande $argument
      echo $find_res
      #On peut donc quitter vu qu'on doit afficher la première trouvée
      exit
    fi
    #On change la valeur de res avec la nouvelle partie
    res=`echo $chemins | cut -d':' -f$i`
  done
