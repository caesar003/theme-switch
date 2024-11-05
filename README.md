# Theme Switch

`theme-switch` is a simple CLI tool to toggle between light and dark themes for Neovim and Kitty. With customizable templates, it allows you to set up and switch themes effortlessly from the command line, quite useful for those who are ocasionally code from indoor to outdoor and vice versa.

## Table of Contents

-   [Features](#features)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Configuration](#configuration)
-   [Uninstallation](#uninstallation)
-   [License](#license)

## Features

-   Toggle between light and dark themes for Neovim and Kitty with a single command.
-   Auto-completion support for easy command usage.
-   Man page documentation included.
-   Configurable templates for both themes, allowing full customization.

## Installation

For Debian-based systems, the easiest way to install `theme-switch` is by downloading the `.deb` package from the [releases page](https://github.com/yourusername/theme-switch/releases).

1. **Download the .deb package**:

    ```bash
    wget https://github.com/yourusername/theme-switch/releases/download/v1.0/theme-switch_1.0_amd64.deb
    ```

2. **Install the package**:
    ```bash
    sudo dpkg -i theme-switch_1.0_amd64.deb
    ```

Alternatively, to install from source:

1. Clone this repository and run the `install.sh` script with `sudo`:
    ```bash
    git clone https://github.com/yourusername/theme-switch.git
    cd theme-switch
    sudo ./install.sh
    ```

## Usage

### Commands

-   **`-t` or `--toggle`**: Toggle between light and dark themes.

    ```bash
    theme-switch -t
    ```

-   **`-v` or `--version`**: Display the current version of the program.
    ```bash
    theme-switch -v
    ```

### Manual Page

For detailed usage, you can access the manual page:

```bash
man theme-switch
```

## Configuration

Configuration files are stored in `~/.config/theme-switch/`. Here’s an overview:

-   **Templates**: Modify the theme files in `~/.config/theme-switch/templates/` to customize your themes.
    -   `nvim-dark`, `nvim-light`: Neovim themes
    -   `kitty-dark`, `kitty-light`: Kitty themes
    -   `vim-dark`, `vim-light`: Vim themes

-   **`theme.conf`**: The main configuration file that tracks the current theme and settings for each application. The available options are:

    -   `current_theme`: Specifies the active theme, either `dark` or `light`.
    -   `set_nvim_theme`: Controls whether to apply themes to Neovim (default: `true`).
    -   `set_vim_theme`: Controls whether to apply themes to Vim (default: `true`).
    -   `set_kitty_theme`: Controls whether to apply themes to Kitty (default: `true`).
    -   `nvim_theme`, `vim_theme`, `kitty_theme`: Paths to the theme configuration files for Neovim, Vim, and Kitty, allowing you to specify custom paths if desired.

Update `theme.conf` to customize theme switching behavior and specify paths if they differ from the default setup.


## Uninstallation

To remove `theme-switch`, you can manually delete the following:

1. **Main Script**: `/usr/local/bin/theme-switch`
2. **Configuration Directory**: `~/.config/theme-switch/`
3. **Completion Script**: `/etc/bash_completion.d/theme-switch`
4. **Manual Page**: `/usr/local/share/man/man1/theme-switch.1`

Alternatively, you can create an `uninstall.sh` script to automate this if desired.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Example

Here’s an example of switching themes:

```bash
# To toggle themes:
theme-switch -t

# To check the version:
theme-switch -v
```
