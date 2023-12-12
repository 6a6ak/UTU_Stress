#!/bin/bash

# Function to check if stress is installed
check_stress_installed() {
    if ! command -v stress &> /dev/null
    then
        echo "The 'stress' program is not installed. Please install it before running this script."
        exit 1
    fi
}

# Function to display the menu
show_menu() {
    echo "Choose the desired CPU load level for stress testing:"
    echo "1) 20%"
    echo "2) 40%"
    echo "3) 60%"
    echo "4) 80%"
    echo "5) 90%"
    echo "6) Exit"
}

# Function to perform stress test
perform_stress_test() {
    local load_level=$1
    local num_workers

    # Approximate number of workers for each load level
    # Note: These values are examples and should be calibrated for your specific system
    case $load_level in
        1) num_workers=2 ;;  # 20%
        2) num_workers=4 ;;  # 40%
        3) num_workers=6 ;;  # 60%
        4) num_workers=8 ;;  # 80%
        5) num_workers=10 ;; # 90%
        *) echo "Invalid selection"; exit 1 ;;
    esac

    # Running stress command
    echo "Starting stress test with $num_workers workers to simulate approximately $load_level load level..."
    echo "Please open a new terminal and run 'htop' to monitor CPU usage."
    stress --cpu $num_workers
}

# Check if stress is installed
check_stress_installed

# Main loop
while true; do
    show_menu
    read -p "Enter your choice [1-6]: " choice
    case $choice in
        1) perform_stress_test 1 ;;
        2) perform_stress_test 2 ;;
        3) perform_stress_test 3 ;;
        4) perform_stress_test 4 ;;
        5) perform_stress_test 5 ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please select a number between 1 and 6." ;;
    esac
done
