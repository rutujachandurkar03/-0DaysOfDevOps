#Below is the script of the above task-
#!/bin/bash

# Check if log file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

LOG_FILE=$1

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE does not exist."
    exit 1
fi

# Date of analysis
DATE=$(date "+%Y-%m-%d")

# Initialize variables
ERROR_COUNT=0
CRITICAL_EVENTS=()
declare -A ERROR_MESSAGES

# Read the log file and process each line
while IFS= read -r line || [[ -n "$line" ]]; do
    # Increment error count for "ERROR" or "Failed"
    if [[ "$line" =~ ERROR|Failed ]]; then
        ((ERROR_COUNT++))
    fi

    # Capture critical events with line numbers
    if [[ "$line" =~ CRITICAL ]]; then
        LINE_NUMBER=$(grep -n "$line" "$LOG_FILE" | cut -d: -f1)
        CRITICAL_EVENTS+=("Line $LINE_NUMBER: $line")
    fi

    # Capture and count error messages
    if [[ "$line" =~ ERROR|Failed ]]; then
        ERROR_MESSAGE=$(echo "$line" | grep -oP 'ERROR.*|Failed.*')
        ((ERROR_MESSAGES["$ERROR_MESSAGE"]++))
    fi
done < "$LOG_FILE"

# Generate the summary report file
REPORT_FILE="log_summary_$DATE.txt"

{
    echo "Log Analysis Summary Report - $DATE"
    echo "Log File: $LOG_FILE"
    echo "Total lines processed: $(wc -l < "$LOG_FILE")"
    echo "Total errors found: $ERROR_COUNT"
    echo "-----------------------------------------"
    echo "Top 5 error messages:"

    for message in "${!ERROR_MESSAGES[@]}"; do
        echo "$message: ${ERROR_MESSAGES[$message]}"
    done | sort -nr -k2 | head -n 5

    echo "-----------------------------------------"
    echo "Critical Events:"
    for event in "${CRITICAL_EVENTS[@]}"; do
        echo "$event"
    done
} > "$REPORT_FILE"

echo "Summary report saved to $REPORT_FILE"

# Optional: Move the processed log file to an archive folder
ARCHIVE_DIR="archive"
mkdir -p "$ARCHIVE_DIR"
mv "$LOG_FILE" "$ARCHIVE_DIR/"
echo "Log file moved to $ARCHIVE_DIR"

