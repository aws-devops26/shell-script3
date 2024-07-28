#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "error:: please run with root access "
    exit 1 # other than 0 we need to give 
else
    echo "ur a root user"
fi
yum install mysql -y
if [ $? -ne 0 ]
then
    echo " error:: installing ,my sql failed"
    exit 1
else
    echo "installing mysql success"
fi