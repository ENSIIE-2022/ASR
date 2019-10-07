#!/bin/bash
#NAVETEUR Lucas
#Liste les noms des fichiers de type shellscript dans une arborescence donnée
#et affiche le nombre de lignes de chaque fichiers

path="./"
bash_regex="#!/bin/bash"
for filename in `ls -p $path | grep -v /`;
do
    line=$(head -n 1 "$path$filename")
    number_of_line=$(wc -l "$path$filename" | cut -d' ' -f1)
    if [ $line == $bash_regex ]; then
        echo "$filename is a script with $number_of_line lignes (Does not count line with only \n)"
    fi
done