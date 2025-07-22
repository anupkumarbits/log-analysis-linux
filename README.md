# Linux Log Analyzer - SSH Security Focus

##  Overview
This script analyzes `/var/log/auth.log` (or `/var/log/secure` for CentOS) and provides:

- Total failed login attempts
- Top brute-force IPs
- Invalid usernames
- Root login attempts
- Failed logins per day

## Usage

### 1. Make the script executable
```bash
chmod +x log-analyzer.sh
