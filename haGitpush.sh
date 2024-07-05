#!/bin/bash

# Go to /config folder or change this to your Home Assistant config folder if it is different
cd /root/config

# Add all files to the repository respecting .gitignore rules
git add .

# Commit changes with a message including the current date and time stamp
git commit -m "Auto Backup - $(date +'%d-%m-%Y %H:%M:%S')"

# Push changes to GitHub (assuming 'origin' points to your GitHub repository and 'master' is your branch)
git push -u origin master
