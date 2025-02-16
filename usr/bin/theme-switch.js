#!/bin/env node

const readline = require("readline");

const VERSION = "1.0.0";
const ROOT_CONFIG_DIR = "~/.config";

const USER_CONFIG_FILE = "~/.config/theme-switch/theme.json";
/*
 config file looks like this
{
  "current_theme": "dark",

  "set_kitty_theme": true,
  "set_nvim_theme": true,
  "set_vim_theme": true,

  "kitty_theme_file": "~/.config/kitty/theme.conf", // or user defined path
  "nvim_theme_file": "~/.config/nvim/lua/config/theme.lua", // or user defined path
  "vim_theme_file": "~/.vim/theme.vim" // or user defined path
}
*/

const KITTY_DARK_THEME_TEMPLATE="~/.config/theme-switch/templates/kitty-dark"
const KITTY_LIGHT_THEME_TEMPLATE="~/.config/theme-switch/templates/kitty-dark"
const NVIM_DARK_THEME_TEMPLATE="~/.config/theme-switch/templates/nvim-dark"
const NVIM_LIGHT_THEME_TEMPLATE="~/.config/theme-switch/templates/nvim-light"
const VIM_DARK_THEME_TEMPLATE="~/.config/theme-switch/templates/vim-dark"
const VIM_LIGHT_THEME_TEMPLATE="~/.config/theme-switch/templates/vim-light"



const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

class ThemeSwitch {
  constructor(){
    this.config = null;

  }

  toggle(){
    // figure out current theme 
    // apply opposite theme
    //
    // in shell I will simply do the following
    // cp ~/.config/theme-switch/templates/vim-<dark|light> ~/.vim/theme.vim
    // cp ~/.config/theme-switch/templates/nvim-<dark|light> ~/.config/nvim/lua/config/theme.lua
    // cp ~/.config/theme-switch/templates/kitty-<dark|light> ~/.config/kitty/theme.conf
  }

  init(){
    // TODO: there are quite a lot to do here

  }
}

const themeSwitch = new ThemeSwitch();

const command = process.argv[2];
const arg = process.argv[3];

switch (command) {
  case "-v":
  case "--version":
    console.log("initializing");
    break;

  case "-h":
  case "--help":
    console.log("printing this help message");
    break;

  case "-t":
  case "--toggle":
    console.log("Toggling");

    break;

  case "-r":
  case "--reload":
    console.log("reloading");
    break;

  case "-o":
  case "--opacity":
    console.log("Setting opacity of 0.84 to dark theme");
    break;

  case "-i":
  case "--init":
    console.log("initializing");
    rl.question("X: ", (y) => {
      console.log(y);
      rl.close();
    });
    break;
  default:
    console.log("invalid  option");
    rl.close();
}
