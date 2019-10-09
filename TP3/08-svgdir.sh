#!/bin/bash
#NAVETEUR Lucas

svgdir () {
    #Vérification des arguments
    if [ -z $2 ] || [ ! -z $3 ]; then
        echo "Usage : bash 04-doslike.sh <arg1> <arg2>"
        exit
    fi
    cp -r $1 $2
}


svgdir $1 $2