#!/bin/bash
SOURCE_DIR="/tmp/shellscript-logs"
R="\e[31m"
N="\e[0m"
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R source directory : $SOURCE_DIR  does not exists $N"
fi
FILES-TO-DELETE=$(find $SOURCE_DIR -type f -mtime +15 -name "*.log")
while IFS=read -r line
do
    echo " deleting file:$line"
    rm -rf $line
done <<< $FILES-TO-DELETE
