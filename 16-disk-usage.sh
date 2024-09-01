#!/bin/bash
DISK_USAGE=$(df -hT | grep -vE 'tmp|file')
DISK_THRESHOLD=1
message=""
while IFS=read line
do 
    usage=$(echo $line | awk '{print$6f}' | cut -d % -f1)
    partition=$(echo $line | awk '{print$1f}')
    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="HIGH DISK USAGE ON $partition:$usage \n"
    fi
done <<< $DISK_USAGE
echo "Message:$message"
