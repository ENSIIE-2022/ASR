#!/bin/bash

#Liste les noms des fichiers de type shellscript dans une arborescence donnée
#et affiche le nombre de lignes de chaque fichiers

path="/usr/"
bash_regex="#!/bin/bash"
for filename in `ls -p $path | grep -v /`;
do
    line=$(head -n 1 "$path$filename")
    if [ $line == $bash_regex ]; then
        echo "$filename is a script"
    fi
done