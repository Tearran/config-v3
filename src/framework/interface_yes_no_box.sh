#!/usr/bin/env bash


function _about_interface_yes_no() {
	cat <<EOF
Usage: interface_yes_no <message> <next_action>
	<message>       The message to show in the Yes/No dialog.
	<next_action>   Callback function to call with result ("No" if cancelled).
	help            Show this message.

Example:
	interface_yes_no "Are you sure?" _process_yes_no
EOF
}


function _process_yes_no() {
	local input="${1:-}"
	if [ "$input" = "No" ]; then
		echo "User canceled. Exiting."
		exit 0
	else
		echo "User confirmed."
		# Place your logic here.
	fi
}


function interface_yes_no() {
	local message="$1"
	local next_action="$2"
	local allowed_functions=("_process_yes_no")
	local found=0

	case "$message" in
		help|-h)
		_about_interface_yes_no
		return 0
		;;
		*)
		for func in "${allowed_functions[@]}"; do
			if [[ "$func" == "$next_action" ]]; then
				found=1
				break
			fi
		done

		if [[ "$found" -eq 1 ]]; then
			if "$DIALOG" --yesno "$message" 10 80 3>&1 1>&2 2>&3; then
				"$next_action"
			else
				"$next_action" "No"
			fi
		else
			echo "Error: Invalid function"
			exit 1
		fi
		;;
	esac
}


# Example usage: Only run if called directly, not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	DIALOG="${DIALOG:-whiptail}"
	interface_yes_no "$1" _process_yes_no
fi
