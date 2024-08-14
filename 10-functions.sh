#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [$1 -ne 0 ]
    then
        echo " ERROR:: $2.....FAILED"
        exit 1
    else
        echo " $2.....SUCCESS"
    fi

}
if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run with root access $N"
    exit 1
else
    echo " $G u r root user $N "
fi
yum install mysql -y
VALIDATE $? " installing my sql"
yum install git -y
VALIDATE $? " installing git"