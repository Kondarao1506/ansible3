#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 FAILED........"
    else
        echo "$2 SUCCESS........"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run with root priviliges like....sh $0"
    exit 1
fi

echo "Please enter the package to install"
read PACKAGE

dnf installed $PACKAGE 
if [ $? -ne 0 ]
then    
    echo "Installing $PACKAGE .........."
    dnf install $PACKAGE -y
    VALIDATE $? "installing $PACKAGE...."
else
    echo "$PACKAGE is already installed"
fi

