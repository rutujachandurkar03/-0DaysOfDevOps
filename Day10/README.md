Challenge Title: Log Analyzer and Report Generator
Scenario
You are a system administrator responsible for managing a network of servers. Every day, a log file is generated on each server containing important system events and error messages. As part of your daily tasks, you need to analyze these log files, identify specific events, and generate a summary report.

Task
Write a Bash script that automates the process of analyzing log files and generating a daily summary report. The script should perform the following steps:

Input: The script should take the path to the log file as a command-line argument.

Error Count: Analyze the log file and count the number of error messages. An error message can be identified by a specific keyword (e.g., "ERROR" or "Failed"). Print the total error count.

Critical Events: Search for lines containing the keyword "CRITICAL" and print those lines along with the line number.

Top Error Messages: Identify the top 5 most common error messages and display them along with their occurrence count.

Summary Report: Generate a summary report in a separate text file. The report should include:

Date of analysis
Log file name
Total lines processed
Total error count
Top 5 error messages with their occurrence count
List of critical events with line numbers
Optional Enhancement: Add a feature to automatically archive or move processed log files to a designated directory after analysis.

Tips
Use grep, awk, and other command-line tools to process the log file.
Utilize arrays or associative arrays to keep track of error messages and their counts.
Use appropriate error handling to handle cases where the log file doesn't exist or other issues arise.
Sample Log File
A sample log file named sample_log.log has been provided in the same directory as this challenge file. You can use this file to test your script or use this

How to Participate
Clone this repository or download the challenge file from the provided link.
Write your Bash script to complete the log analyzer and report generator task.
Use the provided sample_log.log or create your own log files for testing.
Test your script with various log files and scenarios to ensure accuracy.
Submit your completed script by the end of Day 10 of the 90-day DevOps challenge.
Submission
Submit your completed script by creating a pull request or sending the script file to the challenge organizer.

Good luck and happy scripting!
