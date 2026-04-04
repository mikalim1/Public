#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate random integer between 1 and 1000
RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)
echo $RANDOM_NUMBER

#prompt for username
echo Enter your username:
read USERNAME

#check database for username and respond
USERID=$($PSQL "SELECT userid FROM users WHERE username='$USERNAME'")

if [[ -z $USERID ]]
then
  $PSQL "INSERT INTO users (username) VALUES ('$USERNAME')"
  USERID=$($PSQL "SELECT userid FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  #USER=$($PSQL "SELECT username FROM users WHERE userid='$USERID'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE userid=$USERID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE userid=$USERID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi

#guessing functionality
echo "Guess the secret number between 1 and 1000:"

counter=0
GUESS=''

while [[ "$GUESS" -ne "$RANDOM_NUMBER" ]] 
do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    
  elif [ "$GUESS" -lt "$RANDOM_NUMBER" ]
  then
    echo "It's higher than that, guess again:"

  elif [ "$GUESS" -gt "$RANDOM_NUMBER" ]
  then
    echo "It's lower than that, guess again:"
  
  else
    :
  
  fi
  ((counter++))
done

#log game to database
LOG_GAME=$($PSQL "INSERT INTO games (userid, guesses) VALUES ($USERID, $counter)")

echo -e "You guessed it in $counter tries. The secret number was $RANDOM_NUMBER. Nice job!"


