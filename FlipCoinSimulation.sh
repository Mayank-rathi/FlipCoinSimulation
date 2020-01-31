#!/bin/bash -x
echo "Welcome To Flip Coin Simulation"
declare -A Singlet

#Variables
head=0;
tail=0;

read -p "How Many Time You Want To Flip Coin: " n
for((i=0;i<$n;i++))
do
	if [	$((RANDOM%2)) -eq 1 ]
	then
		Singlet[head]=$((++head))
	else
		Singlet[tail]=$((++tail))
	fi
done
echo "Keys ${!Singlet[@]}"
echo "count ${Singlet[@]}"
echo	"Percentage of Head: `echo "scale=2; ${Singlet[head]}*100/$n" | bc`"%
echo	"Percantage of Tail: `echo "scale=2; ${Singlet[tail]}*100/$n" | bc`"%


