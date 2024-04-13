#!/bin/bash

# Function to display stylish banner and project information
. ./banner.sh

# Function to get user's IP address
get_my_ip() {
    my_ip=$(hostname -I)
    echo "Your IP Address: $my_ip"
}

# Source iplookup.sh to include the track_ip function
. ./iplookup.sh

# Function to find MAC address
find_mac_address() {
    arp -a
}

# Function to lookup website information
lookup_website_info() {
    read -p "Enter website URL: " website_url
    echo "Looking up information for website: $website_url"
    curl -sI $website_url
}

# Main function
main() {
    # Display banner
    display_banner

    while true; do
        # Display menu
        display_menu

        # Prompt user for choice
        read -p "Enter your choice: " choice

        # Perform action based on user's choice
        case $choice in
            1) get_my_ip ;;
            2) track_ip ;;
            3) find_mac_address ;;
            4) lookup_website_info ;;
            5) echo "Exiting..."; exit ;;
            *) echo "Invalid choice! Please enter a number from 1 to 5." ;;
        esac

        echo
    done
}

# Execute main function
main

