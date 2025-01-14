#!/bin/bash

echo "All variables passed: $@"
echo "No of variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "Home directory of current variable: $HOME"
echo "which user is running this script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo " process id of las command in background $!"