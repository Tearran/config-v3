#!/usr/bin/env bash

# Print usage/help for this function.
function _about_interface_yes_no_box() {
	cat <<EOF
Usage: interface_yes_no <message> <callback_function>
  <message>           Message to show in the Yes/No dialog.
  <callback_function> Function to call with result ("No" if cancelled).
  help                Show this message.

Example:
  interface_yes_no "Are you sure?" _process_yes_no
EOF
}

# Example callback function.
function _process_yes_no() {
	local input="${1:-}"
	if [[ "$input" == "No" ]]; then
		echo "User canceled. Exiting."
		exit 1
	else
		echo "User confirmed."
		# Place your custom logic here.
	fi
}

# Main yes/no dialog function.
function interface_yes_no() {
	local message="${1:-}"
	local callback="${2:-}"

	if [[ "$message" == "help" || "$message" == "-h" ]]; then
		_about_interface_yes_no_box
		return 0
	fi

	if [[ -z "$message" || -z "$callback" ]]; then
		echo "Error: Missing arguments." >&2
		_about_interface_yes_no_box
		return 1
	fi

	# Optionally restrict callbacks here, or trust caller
	if declare -F "$callback" > /dev/null; then
		: # OK
	else
		echo "Error: Callback function '$callback' not found." >&2
		return 2
	fi

	local dialog="${DIALOG:-whiptail}"

	if "$dialog" --yesno "$message" 10 80 3>&1 1>&2 2>&3; then
		"$callback"
	else
		"$callback" "No"
	fi
}
