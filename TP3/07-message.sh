#!/bin/bash
#NAVETEUR Lucas

envoi() {
    #Sending to user $1 the file $2
    exist=`cat /etc/passwd | grep /$1: | wc -l`
    if [ $exist = 0 ]; then
        echo "The user $1 does not exist"
        exit
    fi
    user_tty=`who | grep $1 | cut -d' ' -f2`
    if [ `cat $2 | write $1`="write: $1 has messages disabled" ]; then
        echo "Sending the message by mail"
        cat $2 | mail -s "Mail from bash script" $1
    fi
    echo "done"
}


if [ -z $2 ]; then
    echo "Usage : bash 07-message.sh <username> <filename>"
    exit
else
    envoi $1 $2
fi