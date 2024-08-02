#!/bin/bash

# Function to map alphabetical characters to special characters
function map_to_special_char() {
    local char="$1"
    case "$char" in
        [aA]) echo -n "@" ;;
        [eE]) echo -n "3" ;;
        [iI]) echo -n "1" ;;
        [oO]) echo -n "0" ;;
        [sS]) echo -n "\$" ;;
        *) echo -n "$char" ;;
    esac
}

# Function to generate password variations based on keywords and length
function generate_passwords() {
    local keywords=("$@")
    local length=$1
    local num_keywords=$((${#keywords[@]}))
    
    echo "Generating password variations for keywords: ${keywords[*]}"
    echo "Desired password length: $length"
    
    # Generate permutations of keywords
    permutations=()
    for (( i=0; i<$num_keywords; i++ )); do
        for (( j=0; j<$num_keywords; j++ )); do
            for (( k=0; k<$num_keywords; k++ )); do
                if [ $i -ne $j ] && [ $i -ne $k ] && [ $j -ne $k ]; then
                    permutation="${keywords[i]}${keywords[j]}${keywords[k]}"
                    local password=""
                    for (( m=0; m<$length; m++ )); do
                        idx=$((m % ${#permutation}))
                        char="${permutation:$idx:1}"
                        mapped_char=$(map_to_special_char "$char")
                        password="${password}${mapped_char}"
                    done
                    permutations+=("$password")
                fi
            done
        done
    done
    
    # Display permutations
    for (( idx=0; idx<${#permutations[@]}; idx++ )); do
        echo "Option $((idx+1)): ${permutations[idx]}"
    done
}

# Function to display the home interface with colors and ASCII art
function display_home() {
    clear
    figlet -f starwars -c "Pass Gen" | lolcat
    figlet -f digital -c "Password Generator" 

    echo -e "\e[1;36m"  # Cyan color
    echo "1. Generate Password"
    echo "2. Generate Random Password"
    echo "3. Exit"
    echo -e "\e[0m"  # Reset color

    echo ""
}

# Function to handle "Generate Password" option
function generate_password_option() {
    echo "Generate Password"
    echo "-----------------"
    
    echo "Please enter how many keywords you want to use (between 2 to 4)."

    # Prompt user for number of keywords
    read -p "Enter the number of keywords: " num_keywords

    # Validate number of keywords
    if ! [[ $num_keywords =~ ^[2-4]$ ]]; then
        echo "Error: Number of keywords must be between 2 to 4."
        return 1
    fi

    # Prompt user for keywords
    keywords=()
    for (( i=1; i<=$num_keywords; i++ )); do
        read -p "Enter keyword $i: " keyword
        keywords+=("$keyword")
    done

    # Prompt user for password length
    read -p "Enter the desired length of the password: " length

    # Validate password length
    if ! [[ $length =~ ^[0-9]+$ ]]; then
        echo "Error: Password length must be a number."
        return 1
    fi

    echo ""
    # Generate and display password variations
    generate_passwords "$length" "${keywords[@]}"
}

# Function to handle "Generate Random Password" option
function generate_random_password_option() {
    echo "Generate Random Password"
    echo "------------------------"

    read -p "Enter the desired length of the random password: " length

    # Validate password length
    if ! [[ $length =~ ^[0-9]+$ ]]; then
        echo "Error: Password length must be a number."
        return 1
    fi

    # Generate random password
    random_password=$(generate_random_password "$length")
    echo "Generated random password: $random_password"
}

# Function to generate a random password
function generate_random_password() {
    local length=$1
    local password=$(head /dev/urandom | tr -dc A-Za-z0-9\!\@\#\$\%\^\&\* | head -c $length)
    echo "$password"
}

# Main script
while true; do
    display_home

    # Prompt user for choice
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            generate_password_option
            ;;
        2)
            generate_random_password_option
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number from 1 to 3."
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
done
