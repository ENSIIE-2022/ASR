#!/bin/bash
#NAVETEUR Lucas
#clear && bash 01-sed.sh '#' '#' '!' '#' '-->'

move_passwd () {
    cp /etc/passwd ./passwd.txt
    echo "passwd bougé sous `pwd`/passwd.txt"
}


add_char_begin () {
    sed -e "s/^/$1/" -i "toto.txt"
    echo "le mot \"$1\" à bien été rajouté en début de ligne"
}

add_char_end () {
    sed -e "s/$/$1/" -i "toto.txt"
    echo "le mot \"$1\" à bien été rajouté en fin de ligne"
}

replace_char_begin () {
    sed -e "s/\$$1/$2/" -i "toto.txt"
    echo "le mot \"$1\" à bien été replacé par \"$2\" en fin de ligne"
}

remove_char_begin () {
    sed -e "s/^$1//" -i "toto.txt"
    echo "le mot \"$1\" à bien été rajouté en début de ligne"
}

remove_char_end () {
    sed -e "s/\$$1//" -i "toto.txt"
    echo "le mot \"$1\" à bien été rajouté en début de ligne"
}

#1) supprimer un # en début de ligne
echo "---- PARTIE 1 ----"
move_passwd
remove_char_begin $1

#2) ajouter un # en début de ligne
echo "---- PARTIE 2 ----"
move_passwd
add_char_begin $2

#3) ajouter un ! en fin de ligne
echo "---- PARTIE 3 ----"
move_passwd
add_char_end $3

#4) remplacer un # en début de ligne par <--
echo "---- PARTIE 4 ----"
move_passwd
replace_char_begin $4 $5

#5) ajouter --> en fin de ligne.
echo "---- PARTIE 5 ----"
move_passwd
add_char_end $5
