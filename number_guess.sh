#!/bin/bash

# Database to store user data
DATABASE="number_guess.sql"

# Create database file if it doesn't exist
if [[ ! -f "$DATABASE" ]]; then
    touch "$DATABASE"
fi

# Function to check if user exists and get their stats
check_user() {
    local username=$1
    if grep -q "^$username|" "$DATABASE"; then
        echo "returning"
    else
        echo "new"
    fi
}

# Function to get user stats
get_user_stats() {
    local username=$1
    grep "^$username|" "$DATABASE"
}

# Function to save game
save_game() {
    local username=$1
    local guesses=$2
    
    if grep -q "^$username|" "$DATABASE"; then
        # Update existing user
        local old_stats=$(grep "^$username|" "$DATABASE")
        local games_played=$(echo "$old_stats" | cut -d'|' -f2)
        local best_game=$(echo "$old_stats" | cut -d'|' -f3)
        ((games_played++))
        if [[ $guesses -lt $best_game ]]; then
            best_game=$guesses
        fi
        sed -i "s/^$username|.*/\$username|$games_played|$best_game/" "$DATABASE"
    else
        # New user
        echo "$username|1|$guesses" >> "$DATABASE"
    fi
}

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if user is new or returning
USER_TYPE=$(check_user "$USERNAME")

if [[ "$USER_TYPE" = "returning" ]]; then
    # Get user stats
    STATS=$(get_user_stats "$USERNAME")
    GAMES_PLAYED=$(echo "$STATS" | cut -d'|' -f2)
    BEST_GAME=$(echo "$STATS" | cut -d'|' -f3)
    
    # Print welcome message for returning user
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
    # Print welcome message for new user
    echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))

# Initialize guess counter
GUESS_COUNT=0

# Prompt for guesses
echo "Guess the secret number between 1 and 1000:"

while true; do
    read GUESS
    
    # Check if input is a valid integer
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi
    
    ((GUESS_COUNT++))
    
    # Check the guess
    if [[ $GUESS -eq $SECRET_NUMBER ]]; then
        echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
        save_game "$USERNAME" "$GUESS_COUNT"
        break
    elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
done
