#!/usr/bin/env bash

function interface_info_box() {

	local input
	local TITLE="$TITLE"
	local -a buffer # Declare buffer as an array
	if [ -p /dev/stdin ]; then
		while IFS= read -r line; do
			buffer+=("$line") # Add the line to the buffer
			# If the buffer has more than 10 lines, remove the oldest line
			if ((${#buffer[@]} > 18)); then
				buffer=("${buffer[@]:1}")
			fi
			# Display the lines in the buffer in the infobox

			TERM=ansi $DIALOG --title "$TITLE" --infobox "$(printf "%s\n" "${buffer[@]}")" 16 90
			sleep 0.5
		done
	else

		input="$1"
		TERM=ansi $DIALOG --title "$TITLE" --infobox "$input" 6 80
	fi
	echo -ne '\033[3J' # clear the screen
}

# Example usage: Only run if called directly, not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	DIALOG="${DIALOG:-whiptail}"
	TITLE="${TITLE:-$DIALOG}"
	# use interface_info_box "$(sudo apt-cash search browser)"
	interface_info_box <<< "$@"
fi