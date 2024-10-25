**Linux Cheat Sheet**

**Basic Navigation & Information**

- ls – List directory contents
- cd [directory] – Change directory
- pwd – Print working directory
- clear – Clear terminal screen
- whoami – Show current user
- man [command] – Display manual page for a command
- uname -a – Show system information
- date – Show current date and time
- uptime – Show how long the system has been running

**File & Directory Management**

- mkdir [directory] – Create a new directory
- touch [file] – Create an empty file
- cp [source] [destination] – Copy files or directories
- mv [source] [destination] – Move or rename files/directories
- rm [file] – Remove files (add -r for directories)
- cat [file] – Display file content
- more [file] / less [file] – View file contents page-by-page
- head -n [number] [file] – Show first *n* lines of a file
- tail -n [number] [file] – Show last *n* lines of a file
- find [directory] -name [filename] – Search for files by name

**File Permissions & Ownership**

- chmod [permissions] [file] – Change file permissions
- chown [user]:[group] [file] – Change file ownership
- ls -l – List files with permissions and ownership

**Disk & Storage Management**

- df -h – Show disk usage in human-readable format
- du -sh [directory] – Show disk usage of a directory
- fdisk -l – List all partitions
- mount [device] [directory] – Mount a device to a directory
- umount [directory] – Unmount a device from a directory

**Process Management**

- ps aux – Show running processes
- top – Display active processes with real-time updates
- kill [PID] – Terminate a process by PID
- pkill [process\_name] – Terminate processes by name
- bg – Resume a job in the background
- fg – Bring a job to the foreground

**System Monitoring & Performance**

- free -h – Display free and used memory
- vmstat – Show system performance information
- iostat – Show CPU and disk I/O statistics
- sar – Collect and display system activity information

**Networking**

- ifconfig – Show or configure network interfaces
- ip a – Show all network interfaces and IP addresses
- ping [host] – Check connectivity to a host
- netstat -tuln – Show network connections, listening ports
- traceroute [host] – Display the route packets take to network host
- wget [url] – Download files from the web
- curl [url] – Transfer data from or to a server

**User & Group Management**

- useradd [user] – Add a new user
- userdel [user] – Delete a user
- usermod -aG [group] [user] – Add a user to a group
- passwd [user] – Change password for a user
- groupadd [group] – Create a new group

**System Updates & Package Management**

For **Debian/Ubuntu**:

- apt update – Update package list
- apt upgrade – Upgrade installed packages
- apt install [package] – Install a new package
- apt remove [package] – Remove a package

For **RHEL/CentOS**:

- yum update – Update packages
- yum install [package] – Install a new package
- yum remove [package] – Remove a package

**File Compression & Archiving**

- tar -cvf archive.tar [file/dir] – Create a tar archive
- tar -xvf archive.tar – Extract a tar archive
- gzip [file] – Compress a file
- gunzip [file.gz] – Decompress a file

**Text Processing**

- grep [pattern] [file] – Search for a pattern in files
- sed 's/[pattern]/[replacement]/' [file] – Replace text in a file
- awk '{print $1}' [file] – Pattern scanning and processing language
- sort [file] – Sort file contents
- uniq [file] – Filter duplicate lines in a file

**SSH & Remote Connections**

- ssh user@host – Connect to a remote host via SSH
- scp [source] [user@host:destination] – Copy files to/from a remote host
- rsync -av [source] [destination] – Synchronize files and directories

**System Logs & Troubleshooting**

- dmesg – Display system boot log
- tail -f /var/log/syslog – Follow system log in real-time
- journalctl -xe – View systemd service logs
- lsof – List open files and associated processes

**System Shutdown & Restart**

- shutdown -h now – Shut down the system immediately
- reboot – Restart the system
- systemctl [command] [service] – Manage services (e.g., systemctl start sshd)

**Scripting Basics**

- echo "Hello World" – Print text
- bash script.sh – Run a shell script
- chmod +x script.sh – Make a script executable
- crontab -e – Edit cron jobs for scheduled tasks
