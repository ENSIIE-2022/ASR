#!/bin/bash
#NAVETEUR Lucas

step1 () {
    if [ -z $1 ]; then
        ls ./
    else
        ls $1
    fi
}

step2 () {
    echo "Le fichier $1 doit-il être renommé en $2 ? (*/RETURN)"
    read response
    if [ ! $response = "RETURN" ]; then
        #On souhaite renommer le fichier source $1
        if [ $1 = $2 ]; then
            echo "Le fichier destination est le même que le fichier source, arrêt du programme"
        else
            if [ -f $2 ]; then
                echo "Vous allez écraser le fichier $2 par le fichier $1, souhaitez-vous continuer ? (Y/N)"
                read replace
                if [ $replace = "Y" ]; then
                    mv $1 $2
                else
                    echo "Annulation de modification, arrêt du programme..."
                fi
            else
                mv $1 $2
            fi
        fi
    else
        echo "Annulation de modification, arrêt du programme"
    fi
}

step1 $1
step2 $1 $2