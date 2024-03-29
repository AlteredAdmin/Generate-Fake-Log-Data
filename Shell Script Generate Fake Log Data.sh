#!/bin/bash

# Parameters
interval_in_seconds=5  # Interval between log entries
duration_in_minutes=1  # Duration to run the script (in minutes)
log_message="Special log entry"  # Custom log message
log_file_path="/path/to/your/log_file.log"  # Path to the log file

# End time calculation in seconds
end_time=$(($(date +%s) + duration_in_minutes * 60))

# Fake log messages
fake_messages=(
    "Info: System check completed successfully."
    "Warning: Low memory detected on server at 192.168.0.101."
    "Error: Network connection lost with gateway 10.0.0.1."
    "Info: User 'admin' logged in from 172.16.254.1."
    "Error: Unable to access database at db.example.com."
    "Warning: High CPU usage detected from process id 1579."
    "Info: New software update available for domain controller."
    "Error: File 'config.txt' not found in the directory on host example.net."
    "Warning: Unauthorized access attempt detected from IP 198.51.100.14."
    "Info: Backup completed with warnings for site www.example.org."
    "Error: Printer 'OfficePrinter' at 203.0.113.5 not responding."
    "Info: Security scan initiated for subnet 192.168.1.0/24."
    "Warning: Disk space reaching capacity on www.datastorage.com."
    "Error: Service 'WebServer' terminated unexpectedly on 192.168.2.110."
    "Info: Email server connection restored for mx.example.com."
    "Warning: Suspicious login attempt from 203.0.113.76 for user 'jdoe'."
    "Error: Application 'AppService' crashed due to memory overflow on 10.10.1.200."
    "Info: New user account 'lsmith' created for domain mydomain.com."
    "Warning: System time out of sync by more than 5 minutes at ntp.mydomain.com."
    "Error: Data synchronization failed between primarysite.com and backupsite.com."
    "Info: Successful SQL database connection established with dbserver.example.com."
    "Warning: SQL database login attempt failed for user 'dbuser' on database 'SalesDB'."
    "Error: SQL database connection timeout for user 'appuser' on dbserver.internal.net."
    "Info: SQL transaction completed successfully on database 'HRDB'."
    "Warning: SQL query execution time exceeded threshold on database 'InventoryDB'."
    "Error: Unable to establish SQL database connection with dbcluster.example.org due to network issues."
)

# Main loop
while [[ $(date +%s) -lt $end_time ]]; do
    # Randomly decide whether to write custom log message or a fake message
    if [ $((RANDOM % 10)) -lt 2 ]; then  # Roughly 20% chance to write the custom log message
        message="$log_message"
    else
        index=$((RANDOM % ${#fake_messages[@]}))
        message="${fake_messages[$index]}"
    fi

    # Write the selected message to the log file with timestamp
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $message" >> "$log_file_path"

    # Wait for the specified interval
    sleep $interval_in_seconds
done

echo "Log generation completed."
