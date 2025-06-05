#!/usr/bin/env bash

function interface_message() {
	local input
	# Check if argument is provided
	if [[ -n "$1" ]]; then
		input="$1"
	else
		input=$(cat)
	fi
	# Display menu based on DIALOG tool
	case "$DIALOG" in
		"dialog")
		dialog --title "$TITLE" --msgbox "$input" 0 0 2>&1 >/dev/tty
		;;
		"whiptail")
		whiptail --title "$TITLE" --msgbox "$input" 0 0 3>&1 1>&2 2>&3
		;;
		"read")
		echo "$input"
		;;
		"help")
		_about_interface_message_box
		;;
		*)
		echo "$input"
		return 1
		;;
	esac
}


_about_interface_message_box() {
	cat <<EOF
Usage: interface_message <std pipe||"$1">
Examples:
	interface_message "$1"
	echo "string" | interface_message
	interface_message <<< "hello"
EOF

}



