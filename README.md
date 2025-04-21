# Zsh Configuration Setup

This repository contains a setup script (`setup.sh`) to easily configure your zsh environment. It automates the process of creating a symlink to your custom `zshrc` file in your home directory and sourcing environment variables from files within an `env` directory.

## Repository Contents

* **`setup.sh`**: The Bash script responsible for setting up the zsh configuration and environment variables.
* **`zshrc`** (Example - You will provide your custom zsh configuration here): This file should contain your desired zsh settings, aliases, functions, etc.
* **`env/`** (Optional): A directory that can contain files defining environment variables (e.g., `secrets.env`, `development.env`). These files should have lines in the format `VARIABLE_NAME=value`.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/qgjones9/zshrc.git
    cd zshrc
    ```

2.  **Place your `zshrc` file:**
    * Ensure your custom zsh configuration file is named `zshrc` and is located in the root of the cloned repository.

3.  **(Optional) Create an `env` directory and add your environment files:**
    * If you have environment-specific variables you want to load, create a directory named `env` in the root of the repository.

## Running the Setup Script

1.  **Make the script executable:**
    ```bash
    chmod +x setup.sh
    ```

2.  **Execute the script:**
    ```bash
    ./setup.sh
    ```

## Script Functionality

The `setup.sh` script performs the following actions:

### Zsh Configuration Symlink

* Checks if a file named `zshrc` exists in the current directory (the root of this repository).
* Checks if a `.zshrc` file already exists in your home directory (`~/.zshrc`).
* If `.zshrc` exists, it prompts you whether to overwrite it with a symbolic link to the `zshrc` file in the repository.
* If you confirm or if `.zshrc` does not exist, it creates a symbolic link from the `zshrc` file in the repository to `~/.zshrc`. This means that changes you make to the `zshrc` file in the repository will directly affect your zsh configuration.

### Environment Variable Sourcing

* Checks if a directory named `env` exists in the current directory.
* If the `env` directory exists, it iterates through all regular files within this directory.
* For each file found, it sources the file using the `source` command. This will load the environment variables defined in those files into your current shell session.

##  Demo:

[![asciicast](https://asciinema.org/a/y3EDXM63jcwTu2Zc4WOr1pAf4.svg)](https://asciinema.org/a/y3EDXM63jcwTu2Zc4WOr1pAf4)


## Usage Notes

* **Backup your existing `.zshrc`:** Before running the script, it's always a good idea to back up your current `~/.zshrc` file in case you want to revert to it later. You can do this with a command like `cp ~/.zshrc ~/.zshrc.backup`.
* **Applying Environment Variables:** Sourcing the environment files in the `env` directory only affects the current shell session where you run the script. To make these environment variables persistent across new terminal sessions, you might need to add the sourcing logic to your `.zshrc` file itself (e.g., by adding `source <path_to_setup_script>/env/<your_env_file>` or by calling the relevant part of the `setup.sh` script from your `.zshrc`).
* **Customization:** Feel free to modify the `setup.sh` script to suit your specific needs.

## Contributing

Contributions to this repository are welcome. If you have suggestions or improvements, feel free to submit a pull request.

## Support

If you encounter any issues or have questions, please [open an issue](https://github.com/qgjones9/zshrc/issues).