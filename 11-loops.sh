#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
for i in {1..100}
do
    echo -e " $R $i $N"
done
