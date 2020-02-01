#!/bin/bash 
echo "Welcome To Flip Coin Simulation"
declare -A coinsDictionary
#Function to store flip count with respective coin sides
function flipCoin(){
	for(( i=1;i<=$1;i++ ))
	do
		side=""
		for((j=1;j<=$2;j++))
		do
			randomValue=$((RANDOM%2))
			if [ $randomValue -eq 1 ]
			then
				 side+=H
			else
				 side+=T
			fi
		done
		updateCount $side
	done
}

function updateCount()
{
	#Storing the number of occurences with respect to side
	coinsDictionary[$1]=$((${coinsDictionary[$1]}+1))
}
#Function to calculate percentage of occurence of each side
function calculatePercentage()
{
	for i in ${!coinsDictionary[@]}
	do
		coinsDictionary[$i]=`echo "scale=2; ${coinsDictionary[$i]}*100/$noOfFlip" | bc`
	done
		echo "Key :	 	"${!coinsDictionary[@]}
		echo "Percentage :	"${coinsDictionary[@]}
}

#User input for Number flip and fliping coin for singlet and doublet
read -p "Enter how times you want to flip coin: " noOfFlip
read -p "1)Single Coin 2)Double Coin 3)Triple Coin Enter your choice: " choice
#Case For Singlet and Doublet or Triplet
case $choice in
	1)
		noOfCoin=1
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		;;
	2)
		noOfCoin=2
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		;;
	3)
		noOfCoin=3
		flipCoin $noOfFlip $noOfCoin
		calculatePercentage
		;;
	*)
		echo "Invalid Choice"
		;;
esac
