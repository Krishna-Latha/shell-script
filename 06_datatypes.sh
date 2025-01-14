#!/bin/bash

Number1=$1
Number2=$2

TimeStramp=$(date)
echo "time is: $TimeStramp"

SUM=$(($Number1+$Number2))
echo "sum of $Number1 and $Number2 is: $SUM"
