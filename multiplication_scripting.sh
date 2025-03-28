#!/bin/bash

1. read -p "enter a whole number: " num



if [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
        echo "$num is a valid positive whole number."
    else
        echo "$num is NOT a valid positive whole number."
    
fi

read -p "Do you want a Full or Partial multplication table? if Full enter F, if partial enter P: " option  

# Convert input to uppercase to handle lowercase entries
option=$(echo "$option" | tr '[:lower:]' '[:upper:]')

# Check input case
if [[ "$option" == "F" ]]; then
    echo "You entered F."
elif [[ "$option" == "P" ]]; then
    echo "You entered P."
else
    echo "Invalid option. Please enter only 'F' or 'P'."
    exit 1
fi


echo "num1 x num2 = "$((num1 * num2))


# For loop for full multiplication table 
for i in 1 2 3 4 5 6 7 8 9 10; do
    echo "$num x $i = "$(($num * $i))
done

# for partial option

while true; do
    read -p "Enter start number (between 1 and 10): " start
    read -p "Enter end number (between 1 and 10): " end
    
    # Check conditions
    if [[ "$start" -ge 1 && "$start" -le 10 && "$end" -ge 1 && "$end" -le 10 && "$start" -lt "$end" ]]; then
        break
    else
        echo "Invalid input. Start must be smaller than end, and both must be between 1 and 10. Try again."
    fi
done

echo "Valid input: Start=$start, End=$end"


#!/bin/bash

while true; do
    # Prompt user for a number
    read -p "Enter a number for the multiplication table: " number

    # Validate input
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid number."
        
    fi

    # Ask for full or partial table
    read -p "Do you want a full table (1-10) or a partial table? (full/partial): " choice

    if [[ "$choice" == "full" ]]; then
        for i in {1..10}; do
            echo "$number x $i = $((number * i))"
        done
    elif [[ "$choice" == "partial" ]]; then
        read -p "Enter the start number: " start
        read -p "Enter the end number: " end

        # Validate range inputs
        if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]]; then
            echo "Invalid range. Please enter valid numbers."
            continue
        fi
        if (( start > end )); then
            echo "Invalid range. Start number must be less than or equal to end number."
            continue
        fi

        for ((i = start; i <= end; i++)); do
            echo "$number x $i = $((number * i))"
        done
    else
        echo "Invalid choice. Please enter 'full' or 'partial'."
        continue
    fi

    # Ask if the user wants to generate another table
    read -p "Do you want to generate another table? (yes/no): " repeat
    if [[ "$repeat" != "yes" ]]; then
        echo "Goodbye!"
        break
    fi
done