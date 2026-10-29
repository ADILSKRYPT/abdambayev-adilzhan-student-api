#!/bin/bash
# System report by Abdambayev Adilzhan
LOG="$HOME/abdambayev-adilzhan-student-api/logs/Abdambayev_Adilzhan_system_report.log"
{
echo "===== SYSTEM REPORT ====="
echo "Student: Abdambayev Adilzhan"
echo "Date and time: $(date)"
echo "User: $(whoami)"
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
echo "Kernel: $(uname -r)"
echo "--- CPU ---"
lscpu | grep -E "Model name|^CPU\(s\)"
echo "--- Memory ---"
free -h
echo "--- Disk usage ---"
df -h
echo "--- Available disk space on / ---"
df -h / | awk 'NR==2 {print $4}'
echo
} | tee -a "$LOG"
