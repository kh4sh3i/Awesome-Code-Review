#!/bin/bash

# Default directory to search (current directory)
SEARCH_DIR="."

# Parse command-line arguments
while getopts "d:" opt; do
  case $opt in
    d) SEARCH_DIR=$OPTARG ;;  # Directory to search for git repos
    *) echo "Usage: $0 -d DIRECTORY"; exit 1 ;;
  esac
done

# Find all directories that are git repositories and loop through them
find "$SEARCH_DIR" -type d -name ".git" | while read git_dir; do
  # Get the repository directory (parent of .git)
  repo_dir=$(dirname "$git_dir")
  
  # Get the repository name (just the name of the folder)
  repo_name=$(basename "$repo_dir")
  
  # Navigate to the repository directory
  cd "$repo_dir" || continue
  
  # Get the brief commit ID (first 7 characters of the commit ID)
  COMMIT_ID=$(git log -1 --format=%h)
  
  # Display the repository name and brief commit ID in the desired format
  echo "$repo_name :: $COMMIT_ID"
done 
