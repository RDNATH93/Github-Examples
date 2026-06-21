#!/bin/bash
# Save as butler.sh

# Fail safely if any background command acts up
set -eo pipefail

echo -e "\e[1;34m=========================================\e[0m"
echo -e "  Welcome back, \e[1;32m$(whoami)\e[0m! Here is your day:"
echo -e "\e[1;34m=========================================\e[0m"

# Date and Time
echo -e "🕒 \e[1mDate/Time:\e[0m $(date '+%A, %B %d, %Y | %I:%M %p')"

# Core System Health
echo -e "💻 \e[1mUptime:\e[0m    $(uptime -p | sed 's/up //')"
echo -e "💾 \e[1mDisk Usage:\e[0m $(df -h / | awk 'NR==2 {print $5}') occupied"

# Network Check
PUBLIC_IP=$(curl -s https://ifconfig.me || echo "Offline")
echo -e "🌐 \e[1mPublic IP:\e[0m  $PUBLIC_IP"

# Weather Information (uses wttr.in format)
echo -e "\n🌤️  \e[1mLocal Weather Snapshot:\e[0m"
curl -s "https://wttr.in" | head -n 7
