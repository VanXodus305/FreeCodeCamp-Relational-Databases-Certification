#!/bin/bash

PSQL="psql -U postgres -d salon -t --no-align -q"

echo "~~~~~ MY SALON ~~~~~
"

echo "Welcome to My Salon, how can I help you?"

# Display services
$PSQL -c "SELECT service_id, name FROM services ORDER BY service_id" | while IFS='|' read SERVICE_ID NAME
do
  echo "$SERVICE_ID) $NAME"
done

# Read service selection
read SERVICE_ID_SELECTED

# Check if service exists
SERVICE_RESULT=$($PSQL -c "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED" 2>/dev/null)

while [[ -z "$SERVICE_RESULT" ]]
do
  echo "I could not find that service. What would you like today?"
  
  $PSQL -c "SELECT service_id, name FROM services ORDER BY service_id" | while IFS='|' read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED
  SERVICE_RESULT=$($PSQL -c "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED" 2>/dev/null)
done

# Read customer phone
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if customer exists
CUSTOMER_ID=$($PSQL -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" 2>/dev/null)

if [[ -z "$CUSTOMER_ID" ]]
then
  # New customer
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  
  # Insert new customer
  $PSQL -c "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')" 2>/dev/null > /dev/null
  
  # Get the customer_id
  CUSTOMER_ID=$($PSQL -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" 2>/dev/null)
else
  # Existing customer
  CUSTOMER_NAME=$($PSQL -c "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID" 2>/dev/null)
fi

# Read appointment time
SERVICE_NAME=$($PSQL -c "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" 2>/dev/null)
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert appointment
$PSQL -c "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" 2>/dev/null > /dev/null

echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
