#!/usr/bin/env bash

function interface_message() {
	# Check if argument is provided
	if [[ -n "$1" ]]; then
		local input="$1"
	else
		local input=$(cat)
	fi
	# Display menu based on DIALOG tool
	case "$DIALOG" in
		"dialog")
		$DIALOG --title "$TITLE" --msgbox "$input" 0 0 2>&1 >/dev/tty
		;;
		"whiptail")
		whiptail --title "$TITLE" --msgbox "$input" 0 0 3>&1 1>&2 2>&3
		;;
		"read")
		echo "Available options:"
		;;
	esac
}

# for termnal use
# interface_message "$@"

# fpr pipes
# echo "string" | interface_message
# interface_message <<< "hello"
