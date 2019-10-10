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
    for file in "$@"
        do
            echo "En quoi le fichier $file doit-être renommé (chemin complet) ?(*/RETURN)"
            read response
            if [ ! $response = "RETURN" ]; then
                #On souhaite renommer le fichier source $file
                if [ $file = $response ]; then
                    echo "Le fichier destination est le même que le fichier source, arrêt du programme"
                else
                    if [ -f $response ]; then
                        echo "Vous allez écraser le fichier $response par le fichier $file, souhaitez-vous continuer ? (Y/N)"
                        read replace
                        if [ $replace = "Y" ]; then
                            mv $file $response
                        else
                            echo "Annulation de modification, arrêt du programme..."
                        fi
                    else
                        mv $file $response
                    fi
                fi
            else
                echo "Annulation de modification, arrêt du programme"
            fi
        done
}

step1 $1
step2 $1 $2

#C'est pas exactement ca mais c'est déjà bien suffisant pour s'entrainer