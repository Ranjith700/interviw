#!/bin/bash

LOGFILE="/var/log/sys_usage.log"

echo "----- $(date) -----" >> "$LOGFILE"
echo "CPU Usage:" >> "$LOGFILE"
top -bn1 | grep "Cpu(s)" >> "$LOGFILE"

echo "Memory Usage:" >> "$LOGFILE"
free -h >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Disk Usage:" >> "$LOGFILE"
df -h >> "$LOGFILE"
echo "" >> "$LOGFILE"
