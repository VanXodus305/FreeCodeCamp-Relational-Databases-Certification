#!/bin/bash

# Periodic Table Database Element Query Script

# Check if an argument was provided
if [[ -z "$1" ]]; then
    echo "Please provide an element as an argument."
    exit
fi

# Function to search for element
search_element() {
    local search_param="$1"
    
    # Try to find the element by atomic number, symbol, or name
    psql -U postgres -d periodic_table -X -t -A -F'|' << SQL
SELECT elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type 
FROM elements 
FULL JOIN properties ON elements.atomic_number = properties.atomic_number 
FULL JOIN types ON properties.type_id = types.type_id 
WHERE elements.atomic_number = (
    SELECT atomic_number FROM elements 
    WHERE atomic_number::text = '$search_param' 
    OR UPPER(symbol) = UPPER('$search_param') 
    OR INITCAP(name) = INITCAP('$search_param')
    LIMIT 1
) 
LIMIT 1;
SQL
}

# Get the result
RESULT=$(search_element "$1" 2>/dev/null)

# Check if result is empty
if [[ -z "$RESULT" ]]; then
    echo "I could not find that element in the database."
else
    # Parse the result
    IFS='|' read -r atomic_num symbol name mass melting boiling elem_type <<< "$RESULT"
    
    # Output the formatted result without line breaks
    printf "The element with atomic number %s is %s (%s). It's a %s, with a mass of %s amu. %s has a melting point of %s celsius and a boiling point of %s celsius.\n" "$atomic_num" "$name" "$symbol" "$elem_type" "$mass" "$name" "$melting" "$boiling"
fi
