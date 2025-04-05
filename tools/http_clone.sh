#!/bin/bash

# Default values
PER_PAGE=100

# Parse command-line arguments
while getopts "u:g:t:n:" opt; do
  case $opt in
    u) GITLAB_URL=$OPTARG ;;  # GitLab URL
    g) GROUP_ID=$OPTARG ;;    # Group ID
    t) PRIVATE_TOKEN=$OPTARG ;;  # Private Token
    n) USERNAME=$OPTARG ;;    # Username (new option)
    *) echo "Usage: $0 -u GITLAB_URL -g GROUP_ID -t PRIVATE_TOKEN -n USERNAME"; exit 1 ;;
  esac
done

# Check if GITLAB_URL, GROUP_ID, PRIVATE_TOKEN, and USERNAME are provided
if [ -z "$GITLAB_URL" ] || [ -z "$GROUP_ID" ] || [ -z "$PRIVATE_TOKEN" ] || [ -z "$USERNAME" ]; then
  echo "GitLab URL, Group ID, Private Token, and Username are required."
  echo "Usage: $0 -u GITLAB_URL -g GROUP_ID -t PRIVATE_TOKEN -n USERNAME"
  exit 1
fi

# GitLab API URL
GITLAB_API="$GITLAB_URL/api/v4"

# Fetch the list of repositories in the group and extract repository HTTPS URLs
REPOS=$(curl --silent --insecure --header "Private-Token: $PRIVATE_TOKEN" \
  "$GITLAB_API/groups/$GROUP_ID/projects?per_page=$PER_PAGE" \
  | grep -oP '"http_url_to_repo":\s*"\K[^"]+')

# Check if repositories were found
if [ -z "$REPOS" ]; then
  echo "No repositories found or invalid input."
  exit 1
fi

# Loop through and clone each repository using the Personal Access Token and Username in the URL
for REPO in $REPOS; do
  REPO_URL="https://$USERNAME:$PRIVATE_TOKEN@${REPO#https://}"
  echo "Cloning $REPO_URL..."
  git clone --single-branch --branch rc "$REPO_URL"
  if [ $? -ne 0 ]; then
    echo "Failed to clone $REPO. Exiting."
    exit 1
  fi
done

echo "All repositories cloned successfully."
