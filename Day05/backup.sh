#Task2 #Create a Script to Backup All Your Work:
Backups are an important part of a DevOps Engineer's day-to-day activities.
#Create the backup.sh script file.

#!/bin/bash

#This is backup file


timestamp=$(date '+%y-%m-%d_%H-%M-%s')

backup_dir="/home/ubuntu/backup/${timestamp}_backup.zip"

zip -r $backup_dir $1

echo "backup completed"

#Task3 #Read About Cron and Crontab to Automate the Backup Script:
Cron is the system's main scheduler for running jobs or tasks unattended. A command called crontab allows the user to submit, edit, or delete entries to cron. A crontab file is a user file that holds the scheduling information.

#Create the Crontab file and automate the backup Script.
Command used #crontab –e
  */1 * * * * bash /home/ubuntu/backup.sh /home/Ubuntu  (backup for every minute) 
 
 
#Task4 #Read About User Management:
A user is an entity in a Linux operating system that can manipulate files and perform several other operations. Each user is assigned an ID that is unique within the system. IDs 0 to 999 are assigned to system users, and local user IDs start from 1000 onwards.
# Create the createuser.sh script file.

#Create the users

sudo useradd user1
sudo useradd user2


#Display usernames

echo "user created-"

awk -F':' '{ print $1}' /etc/passwd | tail -n 2


