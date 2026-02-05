#!/bin/bash
# Auto-deploy Dashboard on file save

DASHBOARD_DIR="/Users/jolensa/Documents/GitHub/Dashboard"
WEBHOOK_URL="https://n8n.srv1230871.hstgr.cloud/webhook/deploy-dashboard"

cd "$DASHBOARD_DIR"

# Commit and push
git add -A
git commit -m "Auto-update $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

# Trigger server update via webhook
curl -s -X POST "$WEBHOOK_URL" > /dev/null 2>&1

echo "$(date): Deployed!"
