#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1'") 

if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
then
  ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'") 

  if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
  then
    ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'") 

    if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
    then

      echo I could not find that element in the database.
      exit
    fi
  fi
fi

ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER")

ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$ELEMENT_TYPE_ID")

echo "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."