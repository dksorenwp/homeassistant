#!/bin/bash

# Debug: Log file path
LOG_FILE="/config/gitPush.log"

# Start SSH agent (if not already started)
eval $(ssh-agent -s)

# Add SSH key to agent
ssh-add /config/.ssh/id_rsa

# Wait for a moment to ensure key is added (optional)
sleep 1

# Set core.sshCommand for Git to use specific SSH key and ignore SSH configuration
git config core.sshCommand "ssh -i /config/.ssh/id_rsa -F /dev/null"

# Debug: Print date and time of script execution
echo "Script execution started at $(date)" >> "$LOG_FILE"

# Debug: Print current directory
echo "Current directory: $(pwd)" >> "$LOG_FILE"

# Add all files to the repository respecting .gitignore rules
/usr/bin/git add . >> "$LOG_FILE" 2>&1

# Debug: Print git status before commit
/usr/bin/git status >> "$LOG_FILE" 2>&1

# Commit changes with a message including the current date and time stamp
/usr/bin/git commit -m "Auto Backup - $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOG_FILE" 2>&1

# Debug: Print git log after commit
/usr/bin/git log -1 >> "$LOG_FILE" 2>&1

# Push changes to GitHub (assuming 'origin' points to your GitHub repository and 'master' is your branch)
/usr/bin/git push -u origin master >> "$LOG_FILE" 2>&1

# Debug: Print git push output
echo "Git push exit code: $?" >> "$LOG_FILE"

# Debug: Print date and time of script completion
echo "Script execution completed at $(date)" >> "$LOG_FILE"
