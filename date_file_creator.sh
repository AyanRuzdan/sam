#!/bin/bash

# Get current time in a suitable format for a file name
current_time=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a new text file with the current time as its name
touch "$current_time.txt"

echo "New text file created: $current_time.txt"
