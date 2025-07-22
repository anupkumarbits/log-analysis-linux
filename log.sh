#!/bin/bash

# SSH Log Analysis Script

LOGFILE="/var/log/auth.log"  # For Debian/Ubuntu
# For CentOS/RHEL use: /var/log/secure

echo "SSH Failed Login Analysis"
echo "---------------------------"

# 1. Count failed password attempts
FAILED_ATTEMPTS=$(grep "Failed password" "$LOGFILE" | wc -l)
echo "Total Failed SSH Attempts: $FAILED_ATTEMPTS"

# 2. Top 5 IPs with most failures
echo -e "\nTop 5 IPs with Failed Attempts:"
grep "Failed password" "$LOGFILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -5

# 3. Top 5 invalid users
echo -e "\nTop 5 Invalid Users Tried:"
grep "Invalid user" "$LOGFILE" | awk '{print $8}' | sort | uniq -c | sort -nr | head -5

# 4. Root login attempts
echo -e "\nRoot Login Attempts:"
grep "Failed password for root" "$LOGFILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr

# 5. Summary with date
echo -e "\nFailed SSH Attempts Per Day:"
grep "Failed password" "$LOGFILE" | awk '{print $1, $2, $3}' | uniq -c | sort -nr | head -10
