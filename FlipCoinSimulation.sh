#!/bin/bash -x
echo "Welcome To Flip Coin Simulation"
Head=1;
Tail=0;

if [	$((RANDOM%2)) -eq 1 ]
then
	echo "Head"
else
	echo "Tails"
fi
