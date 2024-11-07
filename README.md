# Theme Switch

`theme-switch` is a simple CLI tool to toggle between light and dark themes for Neovim, Kitty, and Vim. Designed for developers who frequently move between indoor and outdoor environments, it allows effortless theme switching with customizable templates.

## Table of Contents

-   [Features](#features)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Configuration](#configuration)
-   [Uninstallation](#uninstallation)
-   [License](#license)

## Features

-   Quickly toggle between light and dark themes for Neovim, Kitty, and Vim.
-   Auto-completion support for streamlined command usage.
-   Detailed view option for checking theme settings across all applications.
-   Built-in man page documentation.
-   Customizable templates for each theme mode, offering complete control over theme settings.

## Installation

For Debian-based systems, install `theme-switch` by downloading the `.deb` package from the [releases page](https://github.com/caesar003/theme-switch/releases).

1. **Download the .deb package**:

    ```bash
    wget https://github.com/caesar003/theme-switch/releases/download/v1.0/theme-switch_1.0_amd64.deb
    ```

2. **Install the package**:

    ```bash
    sudo dpkg -i theme-switch*.deb
    ```

### Install from Source

1. Clone this repository and run the `install.sh` script with `sudo`:

    ```bash
    git clone https://github.com/caesar003/theme-switch.git
    cd theme-switch
    sudo ./install.sh
    ```

## Usage

### Commands

-   **`-t` or `--toggle`**: Toggles the current theme (dark to light or vice versa).

    ```bash
    theme-switch -t
    ```

-   **`-v` or `--version`**: Displays the current version of the program.

    ```bash
    theme-switch -v
    ```

-   **`-d` or `--detail`**: Shows the current theme setting and details for each application (Neovim, Kitty, Vim).

    ```bash
    theme-switch -d
    ```

-   **`-s` or `--set <mode> [--vim | --nvim | --kitty] <colorscheme>`**: Sets a specified application’s theme in a particular mode (dark or light) with the chosen colorscheme.

    ```bash
    theme-switch -s dark --nvim gruvbox
    ```

### Manual Page

For detailed usage information, access the manual page:

```bash
man theme-switch
```

## Configuration

Configuration files are located in `~/.config/theme-switch/`. Here’s an overview:

-   **Templates**: Customize your themes by modifying files in `~/.config/theme-switch/templates/`.

    -   `nvim-dark`, `nvim-light`: Neovim themes.
    -   `kitty-dark`, `kitty-light`: Kitty themes.
    -   `vim-dark`, `vim-light`: Vim themes.

-   **`theme.conf`**: The main configuration file, which tracks the current theme and application settings.

    Key options include:

    -   `current_theme`: Specifies the active theme, either `dark` or `light`.
    -   `set_nvim_theme`: Controls whether themes are applied to Neovim (default: `true`).
    -   `set_vim_theme`: Controls whether themes are applied to Vim (default: `true`).
    -   `set_kitty_theme`: Controls whether themes are applied to Kitty (default: `true`).
    -   `nvim_theme`, `vim_theme`, `kitty_theme`: Paths to theme configuration files, allowing customization if needed.

Update `theme.conf` to control which applications are affected by theme switching and to specify custom theme paths.

## Uninstallation

To manually remove `theme-switch`, delete the following files and directories:

1. **Main Script**: `/usr/local/bin/theme-switch`
2. **Configuration Directory**: `~/.config/theme-switch/`
3. **Completion Script**: `/etc/bash_completion.d/theme-switch`
4. **Manual Page**: `/usr/local/share/man/man1/theme-switch.1`

Alternatively, an `uninstall.sh` script can be created to automate this process.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Examples

Here are some example commands for using `theme-switch`:

```bash
# Toggle between light and dark themes:
theme-switch -t

# Check the current version:
theme-switch -v

# View detailed theme settings for each application:
theme-switch -d

# Set the Neovim theme to 'gruvbox' in dark mode:
theme-switch -s dark --nvim gruvbox

# Set the Kitty theme to 'tokyonight' in light mode:
theme-switch -s light --kitty tokyonight
```
