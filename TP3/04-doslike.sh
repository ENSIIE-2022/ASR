#!/bin/bash
#NAVETEUR Lucas

dir () {
    #Pas besoin de vérification des arguments, car entre 0 et +inf
    i=1
    #Pour chaque variable présentes dans l'ensemble des arguments (A partie du 2, voir le main tout en bas)
    for var in "$@"
        do
            printf "\n$var:\n"
            echo `ls $var`
        done
}

cwd () {
    #Vérification des arguments
    if [ -z $1 ] || [ ! -z $3 ]; then
        echo "Usage : bash 04-doslike.sh <commande> <arg1> <arg2_opt>"
        exit
    fi
    echo "cwd launched"
}

ren () {
    #Vérification des arguments
    if [ -z $2 ] || [ ! -z $3 ]; then
        echo "Usage : bash 04-doslike.sh <commande> <arg1> <arg2>"
        exit
    fi
    echo "ren launched"
}

del () {
    #Vérification des arguments
    if [ -z $1 ]; then
        echo "Usage : bash 04-doslike.sh <commande> <arg1> <argx_opt>"
        exit
    fi
    echo "del launched"
}

typ () {
    #Vérification des arguments
    if [ -z $0 ] || [ ! -z $2 ]; then
        echo "Usage : bash 04-doslike.sh <commande> <arg1> <arg2_opt>"
        exit
    fi
    echo "typ launched"
}

#First argument is command, the rest are options/arguments for functions
if [ -z $1 ]; then
    echo "Usage : bash 04-doslike.sh <commande> <args>"
fi
case $1 in
    dir) 
        dir ${@:2}
        ;;
    cwd) 
        cwd $2
        ;;
    ren) 
        ren $2 $3
        ;;
    del) 
        del $2 $3 $4 $5
        ;;
    typ) 
        typ $2 $3 $4 $5
        ;;
    *)
        echo "Usage : bash 04-doslike.sh <commande> <args>"
        exit
        ;;
esac