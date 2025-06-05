#!/usr/bin/env bash


function _about_interface_menu() {
	cat <<EOF
Usage: interface_menu <module name>
Examples:
	interface_menu module_box_colors
EOF
}


#
# Uses Avalible (Whiptail, DIALOG, READ) for the menu interface
function interface_menu() {
	# Check if the function name was provided
	local function_name="$1"

	if [[ "${function_name}" == "help" ]]; then
		_about_interface_menu
		exit 0
	else
		# Get the help message from the specified function
		menu_list=$("$function_name" menu)
	fi

	# Prepare options for the dialog tool based on help message
	options=()
		while IFS= read -r line; do
		if [[ $line =~ ^[[:space:]]*([a-zA-Z0-9_-]+)[[:space:]]*-[[:space:]]*(.*)$ ]]; then
			options+=("${BASH_REMATCH[1]}" "  -  ${BASH_REMATCH[2]}")
		fi
		done <<< "$menu_list"

	# Display menu based on DIALOG tool
	case "$DIALOG" in
		"dialog")
		choice=$(dialog --title "${function_name^}" --menu "Choose an option:" 0 80 9 "${options[@]}" 2>&1 >/dev/tty)
		;;
		"whiptail")
		choice=$(whiptail --title "${function_name^}" --menu "Choose an option:" 0 80 9 "${options[@]}" 3>&1 1>&2 2>&3)
		;;
		"read")
		echo "Available options:"
		for ((i=0; i<${#options[@]}; i+=2)); do
			echo "$((i / 2 + 1)). ${options[i]} - ${options[i + 1]}"
		done
		read -p "Enter choice number: " choice_index
		choice=${options[((choice_index - 1) * 2)]}
		;;
	esac

	# Check if choice was made or canceled
	if [[ -z $choice ]]; then
		echo "Menu canceled."
		return 1
	fi

	# Call the specified function with the chosen option
	"$function_name" "$choice"
}


# Example usage: Only run if called directly, not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	DIALOG="${DIALOG:-whiptail}"
	interface_menu "$1"

fi
