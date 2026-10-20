#!/bin/bash

# Check if Session ID is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <Session ID>"
  exit 1
fi

SESSION_ID=$1

# Run jules remote pull --apply
echo "Running jules remote pull --apply $SESSION_ID..."
jules remote pull --apply "$SESSION_ID"

# Check if the previous command succeeded
if [ $? -ne 0 ]; then
  echo "Error: jules remote pull failed."
  exit 1
fi

# Git operations
echo "Performing git add, commit, and push..."
git add .
git commit -m "Finish task $SESSION_ID"
git push

echo "Task $SESSION_ID finished and pushed successfully."
