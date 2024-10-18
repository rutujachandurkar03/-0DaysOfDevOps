#!/bin/bash
# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
echo "Enter: $0 directory_name start_number end_number"
exit 1
fi
# Assign arguments to variables
DIR_NAME=$1
START_NUM=$2
END_NUM=$3
# Check if start number and end number are integers
if [ "$START_NUM" -gt "$END_NUM" ]; then
echo "Error: Start number should be less than end number."
exit 1
fi
if ! [[ "$START_NUM" =~ ^[0-9]+$ ]] || ! [[ "$END_NUM" =~ ^[0-9]+$ ]]; then
echo "Error: Start number and end number must be integers."
exit 1
fi
# Create directories
for (( i=START_NUM; i<=END_NUM; i++ )); do
DIR="${DIR_NAME}_${i}"
mkdir "$DIR"
echo "Created directory: $DIR"
done
