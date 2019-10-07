#!/bin/bash
#NAVETEUR Lucas

LC_ALL=fr_FR.UTF-8
mkdir results
for ligne in `cat /etc/dictionaries-common/words`;
do
  word=$ligne
  letter=`echo ${word^^} | cut -c 1`  
  #echo $word "-" $letter
  #Sauvegarde dans le fichier
  path="./results/$letter.res"
  if [ ! -f $path ]; then
    touch $path
  fi
  echo $word >> $path
done