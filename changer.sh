#!/bin/bash

# Prompt the user for input
read -p "Are you rooted? (yes/no): " answer

# Convert the input to lowercase to handle case-insensitivity
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check the user's response
if [[ "$answer" == "yes" ]]; then
    echo "You are rooted!"
elif [[ "$answer" == "no" ]]; then
    echo "You are not rooted. Type Sudo Su ."
    exit 0  # Terminate the script with exit code 0 (success)
else
    echo "Invalid response. Please enter 'yes' or 'no'."
    exit 1  # Terminate the script with exit code 1 (failure)
fi


# Prompt the user to enter their Ether device name
read -p "Enter your Ether device name (e.g., enp0s3): " device_name

# Validate if the device name is non-empty
if [[ -z "$device_name" ]]; then
    echo "Device name cannot be empty."
    exit 1
fi

echo "Write your fake MAC address below -- "
read ether
echo "|||||||||||||||||||||||||||||||||||||||||||||"
echo "changing your MAC address ..."
echo "_____________________________________________"
echo "YOUR MAC ADDRESS CHANGED !"
echo "_____________________________________________"
echo "check below"
echo "_____________________________________________"

ifconfig "$device_name" down
ifconfig "$device_name" hw ether "$ether"
ifconfig "$device_name" up
 
ifconfig "$device_name" down
ifconfig "$device_name" hw ether "$ether"
ifconfig "$device_name" up

ifconfig | grep "$ether"


echo "_________________________________________________________"

echo "Write your fake IP below -- "
read ip

echo "|||||||||||||||||||||||||||||||||||||||||||||"
echo "_____________________________________________"
echo "YOUR IP CHANGED !"
echo "_____________________________________________"

echo "check below"
echo "_____________________________________________"

ifconfig "$device_name" "$ip"
ifconfig | grep "$ip"

echo "_____________________________________________"

echo "ALL DONE :-"

ifconfig "$device_name"
