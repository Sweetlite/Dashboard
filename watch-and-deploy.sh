#!/bin/bash
# Watch for changes and auto-deploy

DASHBOARD_DIR="/Users/jolensa/Documents/GitHub/Dashboard"

echo "Watching $DASHBOARD_DIR for changes..."

fswatch -o "$DASHBOARD_DIR" --exclude "\.git" | while read; do
    sleep 2  # Wait for file to finish saving
    "$DASHBOARD_DIR/auto-deploy.sh"
done
