#!/bin/bash
#NAVETEUR Lucas

string=$(date +%A)
day=$(date +%d)
month=$(date +%B)
year=$(date +%Y)
hour=$(date +%H)
minute=$(date +%M)

echo "$string $day $month $year à $hour""h""$minute"

#Puis dans le bashrc ajouter :
#   alias datefr='bash <path_to_this_script>'