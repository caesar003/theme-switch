#!/bin/bash

THEME_FILE="$HOME/projects/dev-tools/prod/theme-switch/etc/theme-switch/preselected-themes.json"

select_theme() {
	local program=$1    # vim, nvim, kitty
	local type=$2       # dark, light
	local theme_file=$3 # JSON file path

	# Extract themes using jq
	local themes
	themes=$(jq -r ".${program}.${type}.display_names[]" "$theme_file")

	# Check if themes exist (to prevent null errors)
	if [ -z "$themes" ]; then
		echo "Error: No themes found for ${program} ${type}" >&2
		return 1
	fi

	# Display options
	echo "Choose a ${program^} ${type} theme (you can change this later):"
	local i=1
	while read -r theme; do
		echo "$i) $theme"
		((i++))
	done <<<"$themes"

	# Read user choice
	read -rp "Enter the number of your choice: " choice
	local selected_theme
	selected_theme=$(jq -r ".${program}.${type}.file_names[$((choice - 1))]" "$theme_file")

	# Fallback if an invalid choice is entered
	if [ "$selected_theme" = "null" ] || [ -z "$selected_theme" ]; then
		echo "Invalid choice, using default."
		selected_theme=$(jq -r ".${program}.${type}.file_names[0]" "$theme_file")
	fi

	echo "${program} ${type} colorscheme: $selected_theme"
}

# Call the function for each program and type
select_theme "vim" "dark" "$THEME_FILE"
select_theme "vim" "light" "$THEME_FILE"
select_theme "nvim" "dark" "$THEME_FILE"
select_theme "nvim" "light" "$THEME_FILE"
select_theme "kitty" "dark" "$THEME_FILE"
select_theme "kitty" "light" "$THEME_FILE"
