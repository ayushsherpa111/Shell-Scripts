#!/usr/bin/env bash

echo -n "Script Name: "
read SCRIPT

if [ -z $SCRIPT ]; 
then
  echo "Script Name Invalid"
  exit
else
  touch $SCRIPT & $EDITOR $SCRIPT
fi
