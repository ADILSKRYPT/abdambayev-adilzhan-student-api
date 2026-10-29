#!/bin/bash
# System report script. Author: Abdambayev Adilzhan

STUDENT_NAME="Abdambayev Adilzhan"
STUDENT_ID="37144"
STUDENT_GROUP="IT2-2309"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/../logs/Abdambayev_Adilzhan_system_report.log"

{
  echo "=============================================="
  echo " SYSTEM REPORT"
  echo "=============================================="
  echo "Student: $STUDENT_NAME (ID: $STUDENT_ID, group: $STUDENT_GROUP)"
  echo "Date and time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Current user: $(whoami)"
  echo "Operating system: $(. /etc/os-release && echo "$PRETTY_NAME")"
  echo "Kernel version: $(uname -r)"
  echo "--- CPU ---"
  lscpu | grep -E 'Model name|^CPU\(s\)'
  echo "--- Memory ---"
  free -h
  echo "--- Disk usage ---"
  df -h
  echo "--- Available disk space on / ---"
  df -h / | awk 'NR==2 {print "Available: " $4}'
  echo ""
} | tee -a "$LOG_FILE"
