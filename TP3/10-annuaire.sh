#!/bin/bash
#NAVETEUR Lucas

#Fonction pour attraper les signaux
catch_signals(){
    echo "Signal catched"
}


add_user() {
    #Ajouter -e pour le saut de ligne, le >> indique qu'on AJOUTE du contenu et non que l'on REMPLACE
    echo -e $1 >> $2
}

create_file() {
    for line in $(cut -d: -f5 $1 | uniq)
        do
            grep $line $1 >> $line
        done
}

#Prise sur le corrigé
delete_user() {
    if [ -z $2 ]; then
        echo "Usage : bash 10-annuaire.sh <option> <name> <filepath>"
	else
		if grep "^$1" $2 >/dev/null 2>&1
		then
		grep -v "^$1" $2 >/tmp/ann.$$	
		mv $2 ${2}.old
		mv /tmp/ann.$$ $2
		echo $1 supprime
		else
		echo "The user $1 is not registered"
		fi
	fi
}

trap "catch_signals" 2 3 15

if [[ -z $2 ]]; then
    echo "Usage : bash 10-annuaire.sh <option> <filepath>"
    exit
fi

option=$1
filepath=$2

case $option in
    #nom:prenom:tel:bureau:service
    -t)	sort -t: -k 5 -k 1 $filepath ;;
    -T)	sort -t: -k 3 $filepath ;;
    -M)	cut -d: -f1 $filepath ;;
    -d)	cut -d: -f1 $filepath | tail -1 ;;
    -m)	cut -d: -f1,2 $filepath | tr : . ;;
    -g)
        if [[ ! -z $3 ]]; then
            grep -i "^[^:]*$2[^:]*:" "$3"
        else
            echo "Usage : bash 10-annuaire.sh <option> <name> <filepath>"
        fi;;
    -a)	
        if [[ ! -z $3 ]]; then
            add_user $2 $3
        else
            echo "Usage : bash 10-annuaire.sh <option> <line_to_add> <filepath>"
        fi;;
    -e)
        create_file $2;;
    -s)
        delete_user $2 $3;;
    -b)
        if [[ ! -z $3 ]]; then
		    grep "^[^:]*:[^:]*:[^:]*:$2.*:" $3 | cut -d: -f1,2 | tr : . | sort
        else
            echo "Usage : bash 10-annuaire.sh <option> <batiment_letter> <filepath>"
        fi;;
    *)  
        echo "Unknown option, exiting..."
        exit;;
esac