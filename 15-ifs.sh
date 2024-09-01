#!/bin/bash
file=/etc/passwd
R="\e[31m"
N="\e[0m"
if [ ! -f $file]
then
    echo -e "$R source file is: $file does not exists. $N"
fi
while IFS =":" read -r username password user_id group_id user_fullname home_dir 
do
    echo " username: $username"
    echo " user id: $user_id"
done <<< $file