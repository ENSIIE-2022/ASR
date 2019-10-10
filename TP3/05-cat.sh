#!/bin/bash
#NAVETEUR Lucas

datefr () {
    string=$(date +%A)
    day=$(date +%d)
    month=$(date +%B)
    year=$(date +%Y)
    hour=$(date +%H)
    minute=$(date +%M)
    echo "$string $day $month $year à $hour""h""$minute"
}

sendinformation () {
    echo "$(datefr) - `whoami` - $1"
}

newcat () {
    #Vérification des arguments
    if [ -z $1 ]; then
        echo "Usage : bash 04-doslike.sh <arg1> <...> <argx>"
        exit
    fi
    #Pour chaque variable présentes dans l'ensemble des arguments (A partie du 2, voir le main tout en bas)
    for file in "$@"
        do
            cat $@
            echo $(sendinformation $file) | cat - $file > temp && mv temp $file
        done
}

newcat $@