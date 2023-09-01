#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
NUMBER_TO_GUESS=$((RANDOM % 1000 + 1))
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) AS games_played FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_guesses) AS best_game FROM games WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." | sed -E 's/  */ /g'
fi
NUMBER_OF_GUESSES=1
GUESS(){
  if [[ -z $1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi
  read GUESSED
  if [[ ! $GUESSED =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  elif [[ $GUESSED > $NUMBER_TO_GUESS ]]
  then
    ((NUMBER_OF_GUESSES++))
    GUESS "It's lower than that, guess again:"
  elif [[ $GUESSED < $NUMBER_TO_GUESS ]]
  then
    ((NUMBER_OF_GUESSES++))
    GUESS "It's higher than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!" | sed -E 's/  */ /g'
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_guesses, number_to_guess) VALUES($USER_ID, $NUMBER_OF_GUESSES, $NUMBER_TO_GUESS)")
  fi
}
GUESS
