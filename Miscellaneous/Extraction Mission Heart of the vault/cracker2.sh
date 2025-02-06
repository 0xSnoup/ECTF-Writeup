#!/bin/bash

# Starting point: "Misc_5_-_dwarf_vault_200.zip"
current_zip="Misc_5_-_dwarf_vault_200.zip"
passwords_file="passwords.txt"  # File to store all cracked passwords

# Initialize the passwords file
echo "" > "$passwords_file"

# Loop through the zip files from 200 to 1
for i in {200..1}; do
    # Attempt to crack the password and extract the zip
    echo "Cracking password for $current_zip..."
    password=$(fcrackzip -u -D -p /usr/share/wordlists/rockyou.txt -v "$current_zip" | grep "PASSWORD FOUND" | awk '{print $NF}')
    
    if [ -n "$password" ]; then
        echo "Password for $current_zip: $password"
        
        # Save the password to the file
        echo "$password" >> "$passwords_file"
        
        # Extract the zip file using the found password
        unzip -P "$password" "$current_zip"
        
        # If it's not the final zip file (dwarf_vault_1.zip or Misc_5_-_dwarf_vault_200.zip), delete the current zip
        if [[ "$current_zip" != "dwarf_vault_1.zip" && "$current_zip" != "Misc_5_-_dwarf_vault_200.zip" ]]; then
            rm "$current_zip"
        fi
        
        # Move to the next zip file, updating the variable
        current_zip="dwarf_vault_$((i-1)).zip"
    else
        echo "Failed to crack the password for $current_zip"
        break
    fi
done

# At the end, ensure the last zip (dwarf_vault_1.zip) is kept
if [ -f "dwarf_vault_1.zip" ]; then
    echo "Final zip file dwarf_vault_1.zip is retained."
fi

# Ensure Misc_5_-_dwarf_vault_200.zip is kept
if [ -f "Misc_5_-_dwarf_vault_200.zip" ]; then
    echo "Initial zip file Misc_5_-_dwarf_vault_200.zip is retained."
fi

echo "All cracked passwords are stored in $passwords_file"
