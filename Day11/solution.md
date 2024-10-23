
# Task 1: Checking Exit Status
Create a script that attempts to create a directory and checks the exit status:

```bash
#!/bin/bash

mkdir /home/ubuntu/Day11/Task1

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Directory created successfully."
else
    echo "Error: Failed to create directory." >&2
fi
```

# Task 2: Using if Statements for Error Checking
Modify the script to handle errors for multiple steps:

```bash
#!/bin/bash

mkdir /home/ubuntu/Day11/Task2

if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory." >&2
    exit 1
fi

touch /home/ubuntu/Day11/Task2.txt

if [ $? -ne 0 ]; then
    echo "Error: Failed to create file in the directory." >&2
    exit 1
fi

echo "Directory and file created successfully."
```

# Task 3: Using trap for Cleanup
Use trap to handle unexpected script exits and clean up temporary files:

```bash
#!/bin/bash

temp_file=$(mktemp)

# Set a trap to delete the temporary file on exit
trap "rm -f $temp_file; echo 'Temporary file removed';" EXIT

echo "Working with temporary file: $temp_file"

# Simulate a long-running process
sleep 10

# At the end, the temp file will be removed by the trap
```

# Task 4: Redirecting Errors
Redirect errors to a file:

```bash
#!/bin/bash

cat non_existent_file.txt 2> error.log

if [ $? -ne 0 ]; then
    echo "Error: Could not read the file. Check error.log for details."
fi
```

# Task 5: Creating Custom Error Messages
Modify one of the previous scripts to include custom error messages:

```bash
#!/bin/bash

mkdir /home/ubuntu/Day11/Task5

if [ $? -ne 0 ]; then
    echo "Custom Error: Could not create directory at /path/to/directory." >&2
    exit 1
fi

touch /home/ubuntu/Day11/Task5.txt

if [ $? -ne 0 ]; then
    echo "Custom Error: Could not create file.txt in /path/to/directory." >&2
    exit 1
fi

echo "Success: Directory and file created."
```
