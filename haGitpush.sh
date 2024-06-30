#!/bin/bash
{
  echo "Starting Git backup: $(/bin/date +'%d-%m-%Y %H:%M:%S')"
  cd /root/config || exit
  /usr/bin/git add .
  /usr/bin/git commit -m "Auto Backup - $(/bin/date +'%d-%m-%Y %H:%M:%S')"
  /usr/bin/git push -u origin master
  echo "Completed Git backup: $(/bin/date +'%d-%m-%Y %H:%M:%S')"
} >> /root/config/git_backup.log 2>&1