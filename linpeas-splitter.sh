#!/bin/bash

# Input script
input_script="$1"
output_prefix="part"
output_directory="output"

counter=1
mkdir -p "$output_directory"

# Variable to track whether the previous line was "echo ''"
previous_line=""

# Read the script line by line
while IFS= read -r line
do
    # Check if the current and previous lines are both "echo ''"
    if [[ "$previous_line" == "echo ''" && "$line" == "echo ''" ]]; then
        # If it's the divider, save the current part to a file
        if [[ $current_part ]]; then
            echo "$current_part" > "$output_directory/${output_prefix}${counter}.sh"
            
            current_part="source ./${output_prefix}${counter}.sh"$'\n'
            counter=$((counter+1))
        fi
    else
        # Otherwise, add the line to the current part
        current_part="$current_part$line"$'\n'
    fi

    # Update the previous_line variable
    previous_line="$line"
done < "$input_script"

# Save the last part (if exists)
if [[ $current_part ]]; then
    echo "$current_part" > "$output_directory/${output_prefix}${counter}.sh"
fi

echo "Splitting complete. The script has been split into ${counter} parts."
