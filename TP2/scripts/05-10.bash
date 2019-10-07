#!/bin/bash
echo "The date is :"
echo `date | tee res-05-10.txt` 
echo "Connected users are :"
echo `who | tee -a res-05-10.txt`