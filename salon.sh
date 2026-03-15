#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

SERVICE_MENU(){
  
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  echo Please pick a service:
  
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID SERVICE_NAME
  do
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/| //') 
    echo "$SERVICE_ID) $SERVICE_NAME_FORMATTED"
  done
  
  read SERVICE_ID_SELECTED

  SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

  #check if service selection is valid
  if [[ -z $SERVICE_SELECTED ]]
  then
    SERVICE_MENU "That is not a valid option."
  
  fi

  echo -e "\nWhat is your phone number?"

  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  #check if customer exists
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat is your name?"

    read CUSTOMER_NAME

    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')" > /dev/null
  
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  fi
  
  #ask for appointment time
  echo -e "\nHi $CUSTOMER_NAME, what is your preferred appointment time?"

  read SERVICE_TIME

  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_SELECTED, '$SERVICE_TIME')" > /dev/null

  #appointment message
  
  SELECTED_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_SELECTED")
  echo -e "\nI have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"

  exit 
}

SERVICE_MENU
  