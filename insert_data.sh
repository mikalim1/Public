#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#clear the tables
CLEAR_TABLES=$($PSQL "TRUNCATE TABLE games, teams")

#read the csv, define the separator, define the variables
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  #ignore the header row
  if [[ $YEAR != "year" ]]
  then

    #add team from list of winners
    #check if team has already been added from list of winners
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      if [[ -z $TEAM_ID ]]
      then 

        #insert team
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")

          if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
          then
            echo "Inserted into teams, $WINNER"
          fi
      fi

    #add team from list of opponents
    #check if team has already been added from list of opponents
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      if [[ -z $TEAM_ID ]]
      then 

        #insert team
        INSERT_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")

          if [[ $INSERT_TEAM_NAME == "INSERT 0 1" ]]
          then
            echo "Inserted into teams, $OPPONENT"
          fi
      fi
  fi
done

#read the csv, define the separator, define the variables
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  #get the winner id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  #get the opponent id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  
  #add the games
  INSERT_GAME=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")   
  
  if [[ $INSERT_GAME == "INSERT 0 1" ]]
  then
    echo "Inserted a game"
  fi

done