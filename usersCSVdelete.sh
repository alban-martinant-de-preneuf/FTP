#!/bin/bash

IFS=$'\n'

for line in $(cat Shell_Userlist.csv)
do
    id=`echo $line | cut -d "," -f 1`
    firstName=`echo $line | cut -d "," -f 2`
    name=`echo $line | cut -d "," -f 3`
    pwd=`echo $line | cut -d "," -f 4`
    role=`echo $line | cut -d "," -f 5`

    userName=`echo ${firstName:0:1}$name | awk '{print tolower($0)}'`

    if let $id 2>/dev/null
    then
        sudo userdel -r $userName
    fi
done