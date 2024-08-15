#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="\tmp\$0-$TIMESTAMP.log"
VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: $2...FAILED $N"
        exit 1
    else
        echo -e " $G $2...SUCCESS $N"
    fi

}
if [ $ID -ne 0 ]
then
    echo -e " $R ERROR:: please run with root access $N"
    exit 1
    else
    echo -e " $G u r root user $N"
fi
# git mysql postfix net-tools
# package=git for 1st time
for package in $@
do
    yum list installed $package &>> LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> LOGFILE
        VALIDATE $? " installing of $package "
        else
        echo -e " $package is already installed $Y SKIPPING $N "
    fi
done
