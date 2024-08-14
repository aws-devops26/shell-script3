#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " $R ERROR:: $2.....FAILED $N"
        exit 1
    else
        echo -e " $Y $2.....SUCCESS $N"
    fi

}
if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run with root access $N"
    exit 1
else
    echo -e " $G u r root user $N "
fi
yum install mysql -y
VALIDATE $? " installing my sql"
yum install git -y
VALIDATE $? " installing git"