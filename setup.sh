#!/bin/bash

# Set the -e option to exit immediately if a command exits with a non-zero status.
set -e 

# Script to set up zsh configuration and environment variables

# Define the name of the zsh configuration file
ZSHRC_FILENAME="zshrc"

# Define the directory containing environment files
ENV_DIR="env"

# Get the user's home directory
HOME_DIR="$HOME"

# Construct the full path to the zshrc file in the home directory
TARGET_ZSHRC="$HOME_DIR/.$ZSHRC_FILENAME"

# Check if the zshrc file exists in the current directory
if [ -f "$ZSHRC_FILENAME" ]; then
  echo "Found '$ZSHRC_FILENAME' in the current directory."

  # Check if a .zshrc file already exists in the home directory
  if [ -e "$TARGET_ZSHRC" ]; then
    echo "'.zshrc' already exists in your home directory."
    read -p "Do you want to overwrite it with a symlink? (y/N) " overwrite_response
    if [[ "$overwrite_response" =~ ^[Yy]$ ]]; then
      echo "Removing existing '$TARGET_ZSHRC'..."
      rm -f "$TARGET_ZSHRC"
      echo "Creating symlink from '$ZSHRC_FILENAME' to '$TARGET_ZSHRC'."
      ln -s "$(pwd)/$ZSHRC_FILENAME" "$TARGET_ZSHRC"
      echo "Symlink created successfully."
    else
      echo "Skipping symlink creation."
    fi
  else
    echo "Creating symlink from '$ZSHRC_FILENAME' to '$TARGET_ZSHRC'."
    ln -s "$(pwd)/$ZSHRC_FILENAME" "$TARGET_ZSHRC"
    echo "Symlink created successfully."
  fi
else
  echo "Error: File '$ZSHRC_FILENAME' not found in the current directory."
fi

echo ""

# Check if the environment directory exists
if [ -d "$ENV_DIR" ]; then
  echo "Found directory '$ENV_DIR' in the current directory."

  # Source all files within the env directory
  find "$ENV_DIR" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
    echo "Sourcing environment file: '$file'"
    source "$file"
  done
  echo -e "All files in '$ENV_DIR' have been sourced.\n"
else
  echo -e "Warning: Directory '$ENV_DIR' not found in the current directory. Skipping environment sourcing.\n"
fi

# source .zshrc
echo -e "Setup script completed.\n"
echo -e "Run the folllowing command to source your zshrc\n" 
echo "source $HOME/.zshrc"

