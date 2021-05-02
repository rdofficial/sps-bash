# Stone-Paper-Scissors Game [bash/shell script version]

# This script file is created to serve the feature of the stone-paper-scissors game. The script file is written in bash. Thus, it is supported only by linux operating systems. The script file uses basic if..elif..else conditional programming as its algorithm for calculating the results, also the script uses random choices for calculating the choice by the computer. We also make the use of the 'shuf' utility (available in GNU coreutils) in the procedure of getting a random choice by the computer.

# Author : Rishav Das (https://github.com/rdofficial/)
# Created on : April 30, 2021

# Last modified : -
# Done by : -

# Contributors on this project (Add your name if you ever gave something to this script file, do it honestly) :
# 1. Rishav Das (github:https://github.com/rdofficial, email:rdofficial192@gmail.com)
## ----

# Defining the ANSII color codes for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
YELLOW_REV="\033[07;93m"
DEFCOL="\033[00m"

function main {
	# The function contains the code for asking the user for the input, and then calculation of the results of the current round

	# Getting the computer's random choice
	computerChoice=$( shuf -i 1-3 -n 1 )
	if [[ $computerChoice == "1" ]]; then
		# If the random number is 1, then we assign the computer's choice to stone

		computerChoice="stone"
	elif [[ $computerChoice == "2" ]]; then
		# If the random number is 2, then we assign the computer's choice to be paper

		computerChoice="paper"
	elif [[ $computerChoice == "3" ]]; then
		# If the random number is 3, then we assign the computer's choice to be scissors

		computerChoice="scissors"
	else
		# If there is an error in getting the random number, then we display the error message on the console screen and quit the current execution

		echo -e "\n${RED_REV}[ Error : There are some errors in getting the computer's choice, please check and resolve the issue ]${DEFCOL}"
		return 0
	fi

	# Asking the user to enter any of the options (stone, paper, scissors)
	read -p "Enter your choice [stone, paper, scissors ] : " userChoice

	# Checking the user's choice against the computer's choice
	if [[ $userChoice == "stone" ]]; then
		# If the user choosed stone, then we proceed to compare it with computer's choice

		if [[ $computerChoice == "stone" ]]; then
			# If the computer's choice is stone, then it's a draw

			echo -e "[ ${YELLOW}Draw${DEFCOL} : The computer also choosed stone ]"
			echo -e "[ Current score : ${YELLOW}${score}${DEFCOL} ]"
		elif [[ $computerChoice == "paper" ]]; then
			# If the computer's choice is paper, then it's a loss

			score=$(($score-10))
			echo -e "[ ${RED}Loss${DEFCOL} : The computer choosed paper ]"
			echo -e "[ Current score : ${RED}${score}${DEFCOL}]"
		elif [[ $computerChoice == "scissors" ]]; then
			# If the computer's choice is scissors, then it's a win

			score=$(($score+5))
			echo -e "[ ${GREEN}Win${DEFCOL} : The computer choosed scissors ]"
			echo -e "[ Current score : ${GREEN}${score}${DEFCOL}]"
		else
			# If there in an error (computer's choice is not one of stone-paper-scissors), then we display the error on the console screen and quit the current execution

			echo -e "\n${RED_REV}[ Error : There are some in the computer's choice, please check and resolve the issue ]${DEFCOL}"
			return 0
		fi
	elif [[ $userChoice == "paper" ]]; then
		# If the user choosed paper, then we proceed to compare it with computer's choice

		if [[ $computerChoice == "stone" ]]; then
			# If the computer's choice is stone, then it's a win

			score=$(($score+5))
			echo -e "[ ${GREEN}Win${DEFCOL} : The computer choosed stone ]"
			echo -e "[ Current score : ${GREEN}${score}${DEFCOL}]"
		elif [[ $computerChoice == "paper" ]]; then
			# If the computer's choice is paper, then it's a draw

			echo -e "[ ${YELLOW}Draw${DEFCOL} : The computer also choosed paper ]"
			echo -e "[ Current score : ${YELLOW}${score}${DEFCOL} ]"
		elif [[ $computerChoice == "scissors" ]]; then
			# If the computer's choice is scissors, then it's a loss

			score=$(($score-10))
			echo -e "[ ${RED}Loss${DEFCOL} : The computer choosed scissors ]"
			echo -e "[ Current score : ${RED}${score}${DEFCOL}]"
		else
			# If there in an error (computer's choice is not one of stone-paper-scissors), then we display the error on the console screen and quit the current execution

			echo -e "\n${RED_REV}[ Error : There are some in the computer's choice, please check and resolve the issue ]${DEFCOL}"
			return 0
		fi
	elif [[ $userChoice == "scissors" ]]; then
		# If the user choosed scissors, then we proceed to compare it with computer's choice

		if [[ $computerChoice == "stone" ]]; then
			# If the computer's choice is stone, then it's a loss

			score=$(($score-10))
			echo -e "[ ${RED}Loss${DEFCOL} : The computer choosed stone ]"
			echo -e "[ Current score : ${RED}${score}${DEFCOL}]"
		elif [[ $computerChoice == "paper" ]]; then
			# If the computer's choice is paper, then it's a win

			echo -e "[ ${GREEN}Win${DEFCOL} : The computer choosed paper ]"
			echo -e "[ Current score : ${GREEN}${score}${DEFCOL} ]"
		elif [[ $computerChoice == "scissors" ]]; then
			# If the computer's choice is scissors, then it's a draw

			echo -e "[ ${YELLOW}Draw${DEFCOL} : The computer also choosed scissors ]"
			echo -e "[ Current score : ${YELLOW}${score}${DEFCOL} ]"
		else
			# If there in an error (computer's choice is not one of stone-paper-scissors), then we display the error on the console screen and quit the current execution

			echo -e "\n${RED_REV}[ Error : There are some in the computer's choice, please check and resolve the issue ]${DEFCOL}"
			return 0
		fi
	else
		# If the user entered choice is not one of the stone-paper-scissors, then we display the error message on the console and quit the current execution

		echo -e "\n${RED_REV}[ Error : Invalid input, please choose one of the stone, paper, or scissors ]${DEFCOL}"
		return 0
	fi

	read -p "Press the enter key to continue..."
}

# Displaying some messages on console screen before starting the game
echo -e "${YELLOW_REV}NOTE${DEFCOL} :"
echo -e "[${YELLOW}1${DEFCOL}] Play the game, and if you want to quit then press CTRL+C key combo."
echo -e "[${YELLOW}2${DEFCOL}] The final score will be the one shown to you, before exiting the game.\n"
read -p "Press enter key to continue..."

# Defining the score variable which will contain the points that the user achieve during the gameplay
score=0

# Playing the game in a infinite loop (made using while loop with a true condition) until the user exits the script
while true; do
	clear
	main
done
