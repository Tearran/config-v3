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
		dialog --title "$TITLE" --msgbox "$input" 0 0 >/dev/tty 2>&1
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
Usage: interface_message ["message"]
Examples:
	interface_message "Your message here"
	echo "Your message" | interface_message
	interface_message <<< "Your message"
EOF

}



