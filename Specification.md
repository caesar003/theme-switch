# INIT

## Define some selected colorschemes

-   vim (also applies to neovim)
    -   dark
        -   colorscheme files
            -   gruvbox, tokyonight, rosepine_moon, catppuccin_mocha, monokai,
        -   display names
            -   Gruvbox (default), Tokyonight, Rosé Pine, Catppuccin, Monokai,
    -   light
        -   colorscheme files
            -   paper, github_light, rosepine_dawn, catppuccin_latte, material,
        -   display names
            -   Paper (default), Github, Rosé Pine, Catppuccin, Material,
-   kitty
    -   dark
        -   colorscheme files
            -   adwaita_dark, Atom, Catppuccin-Mocha, gruvbox-dark, rose-pine-moon
        -   display names
            -   Adwaita Dark (default), Atom, Catppuccin Mocha, Gruvbox Dark, Rosé Pine Moon,
    -   light
        -   colorscheme files
            -   adwaita_light, AtomOneLight, Catppuccin-Latte, gruvbox-light, rose-pine-dawn
        -   display names
            -   Adwaita Light (default), Atom One Light, Catppuccin Latte, Gruvboox Light, Rosé Pine Dawn,

## Prompt user

    - [x]   selected theme (dark/light) defaul dark
    - [x]  use vim? (Y/n)
    - [x]  use neovim? (Y/n)
    - [x]  use kitty? (Y/n)
    - [x]  vim theme file location (default: ~/.vim/theme.vim)
    - [x]  neovim theme file location (default: ~/.config/nvim/lua/theme.lua)
    - [x]  kitty theme file location (default: ~/.config/kitty/theme.conf)
    - [x]  default theme? (dark | light)
    - [x]  pick kitty opacity -> take number 0 to 1 with 0.1 steps (100 different values) default 1.00
    - [x]  pick kitty color scheme for light and dark theme
    - [x]  pick vim color scheme for light and dark theme
    - [x]  pick neovim color scheme for light and dark theme

-   create configuration directory (~/.config/theme-switch)
-   create theme directory
    -   ~/.config/theme-switch/kitty-themes
    -   ~/.config/theme-switch/vim-themes

## create template directory

**Location**: `(~/.config/theme-switch/templates)`

## generate configuration file

**Location**: (~/.config/theme-switch/theme.conf)

**Content**:

```
current_theme=dark # or light depends on what user chooses
use_vim=true # or false
use_kitty=true # or false
use_nvim=true # or false


nvim_theme_file=~/.config/nvim/lua/config/theme.lua # or user defined path
vim_theme_file=~/.vim/theme.vim # or use defined path
kitty_theme_file=~/.config/kitty/theme.conf # or user defined path
```

## generate template files

**Location**: `(~/.config/theme-switch/templates/<vim|nvim|kitty>-<dark|light>)`

-   **kitty template**: `(~/.config/theme-switch/templates/kitty-<dark-light>)`

```
include ./themes/<selected-theme>.conf
background_opacity <user_chosen_opacity>
```

-   **vim template**: `(~/.config/theme-switch/templates/vim-<dark|light>)`

```vim
set background=dark " depends on file name
colorscheme monokai-phoenix " User chosen colorscheme
```

-   **neovim template**: `(~/.config/theme-switch/templates/nvim-<dark|light>)`

```lua
vim.cmd.colorscheme("oh-my-monokai") -- user chosen color
vim.opt.background = "dark" -- or light depends on file name
```

### Read repository list

**file to read**: `/etc/theme-switch/repo-list.json`

**what to look**:

the json structured this way:

```typescript
interface RepoItem {
    id: number;
    theme: "kitty" | "vim";
    repo: string;
}
```

**what to do**:

-   loop through each item
-   clone the repo into a template file,
-   get the information of `theme` field
    -   vim theme -> copy `repo/colors/*` to vim theme directory `(~/.config/theme-switch/vim-themes)`
    -   kitty theme -> copy `repo/colors/*` to kitty theme directory `(~/.config/theme-switch/vim-themes);`
-   there are a few broken vim themes listed in `/etc/theme-switch/issues.txt`,
    -   one file per line, <colorscheme>.vim,
    -   loop through this, remove every one of them from `~/.config/theme-switch/vim-themes/<broken-colorscheme>.vim`
-   create symbolic link of ~/.config/theme-switch/kitty-themes/ directory to ~/.config/kitty/themes
-   create symbolic link of ~/.config/theme-switch/vim-themes/ directory to ~/.config/nvim/colors
-   create symbolic link of ~/.config/theme-switch/vim-themes/ directory to ~/.vim/colors
-   create a copy of ~/.config/theme-switch/templates/kitty-<chosen-theme> to ~/.config/kitty/theme.conf
-   create a copy of ~/.config/theme-switch/templates/nvim-<chosen-theme> to ~/.config/nvim/theme.conf
-   create a copy of ~/.config/theme-switch/templates/vim-<chosen-theme> to ~/.vim/nvim/theme.vim
