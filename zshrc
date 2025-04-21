################################################
# PATH
################################################
# home
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# postgresql
export PATH=/Library/PostgreSQL/17/bin:$PATH

################################################
# omz
################################################
export ZSH_THEME="robbyrussell"
export ENABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
export ZSH="$HOME/.oh-my-zsh"

# plugins
plugins=(docker docker-compose git)

# source omz
source $ZSH/oh-my-zsh.sh

####################################################
# auto completions
####################################################
# Function to set up Terraform autocompletion if installed.
setup_terraform_autocomplete() {
  # Dynamically find the Terraform executable
  TERRAFORM_PATH=$(command -v terraform)

  # Check if Terraform was found
  if [ -n "$TERRAFORM_PATH" ]; then
    # echo "Terraform found at: $TERRAFORM_PATH. Setting up autocompletion."

    # Set up autocompletion using the dynamically found path
    complete -o nospace -C "$TERRAFORM_PATH" terraform
    # echo "Terraform autocompletion set up."
  else
    # echo "Terraform is not installed or not found in PATH. Skipping autocompletion setup."
  fi
}

# Function to set up Docker autocompletion.
setup_docker_autocomplete() {
  # # docker 
  # fpath=(/Users/mastery/.docker/completions $fpath)
  # autoload -Uz compinit
  # compinit

  # Check if the operating system is zsh (where these commands are relevant)
  if [[ "$SHELL" == *zsh* ]]; then
    # echo "Detected zsh. Setting up Docker autocompletion."

    # Define the Docker completions directory
    DOCKER_COMPLETIONS_DIR="$HOME/.docker/completions"

    # Add the Docker completions directory to fpath if it's not already there
    if [[ ":$fpath:" != *":$DOCKER_COMPLETIONS_DIR:"* ]]; then
      # echo "Adding '$DOCKER_COMPLETIONS_DIR' to fpath."
      fpath=("$DOCKER_COMPLETIONS_DIR" $fpath)
    else
      # echo "'$DOCKER_COMPLETIONS_DIR' is already in fpath."
    fi

    # Autoload and initialize the completion system
    if type autoload >/dev/null 2>&1 && type compinit >/dev/null 2>&1; then
      autoload -Uz compinit
      compinit
      # echo "Docker autocompletion set up."
    else
      # echo "Warning: 'autoload' or 'compinit' command not found. Ensure zsh is properly configured."
    fi

  else
    # echo "Current shell is not zsh. Skipping Docker autocompletion setup."
  fi
}


# Function to set up Angular CLI autocompletion in zsh if installed.
setup_angular_autocomplete() {

  # Angular CLI
  # source <(ng completion script)

  # Check if the current shell is zsh
  if [[ "$SHELL" == *zsh* ]]; then
    # echo "Detected zsh. Setting up Angular CLI autocompletion."

    # Check if the 'ng' command is available (indicating Angular CLI is likely installed)
    if command -v ng >/dev/null 2>&1; then
      # echo "Angular CLI ('ng') found. Attempting to set up autocompletion."

      # Execute the ng completion script and source its output
      source <(ng completion script)
      # echo "Angular CLI autocompletion set up."
    else
      # echo "Angular CLI ('ng') not found. Skipping autocompletion setup."
    fi

  else
    # echo "Current shell is not zsh. Skipping Angular CLI autocompletion setup."
  fi
}

setup_heroku_autocomplete(){
  # HEROKU
  # Script to conditionally set the HEROKU_AC_ZSH_SETUP_PATH environment variable
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # echo "Operating system is macOS."

    # Define the Heroku CLI zsh setup path using the user's home directory
    HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup"

    # Check if the heroku zsh setup file exists
    if [ -f "$HEROKU_AC_ZSH_SETUP_PATH" ]; then
      # echo "Heroku CLI zsh setup file found at: $HEROKU_AC_ZSH_SETUP_PATH"
      source "$HEROKU_AC_ZSH_SETUP_PATH"
      # echo "HEROKU_AC_ZSH_SETUP_PATH environment variable set and zsh setup sourced."
    else
      # echo "Heroku CLI zsh setup file not found at: $HEROKU_AC_ZSH_SETUP_PATH"
      # echo "Skipping environment variable setup."
    fi

  else
    # echo "Operating system is not macOS. Skipping Heroku CLI setup."
  fi
}

# autocompletion
setup_docker_autocomplete
setup_terraform_autocomplete
setup_angular_autocomplete
setup_heroku_autocomplete

