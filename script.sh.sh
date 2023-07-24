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
fi


echo "Write your fake mac address below -- "
read ether
echo "|||||||||||||||||||||||||||||||||||||||||||||"
echo "changing you mac address ..."
echo "_____________________________________________"
echo "YOUR MAC ADDRESS CHANGED !"
echo "_____________________________________________"
echo "check below"
echo "_____________________________________________"

ifconfig enp0s3 down
ifconfig enp0s3 hw ether $ether
ifconfig enp0s3 up
 
ifconfig enp0s3 down
ifconfig enp0s3 hw ether $ether
ifconfig enp0s3 up

ifconfig | grep $ether


echo "_________________________________________________________"




echo "Write your fake ip below -- "
read ip

echo "|||||||||||||||||||||||||||||||||||||||||||||"
echo "_____________________________________________"
echo "YOUR IP CHANGED !"
echo "_____________________________________________"

echo "check below"
echo "_____________________________________________"

ifconfig enp0s3 $ip
ifconfig | grep $ip

echo "_____________________________________________"

echo "ALL DONE :-"

ifconfig

