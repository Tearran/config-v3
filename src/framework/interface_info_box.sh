#!/usr/bin/env bash

about_interface_info_box() {
    cat <<EOF
Usage: interface_info_box

Reads lines from stdin and displays them in a rolling infobox using whiptail/dialog.

Examples:
  some_command | interface_info_box
  echo "Hello" | interface_info_box
  interface_info_box -h
EOF
}

interface_info_box() {
    # Help flag: show about if -h or --help is the first argument
    case "$1" in
        "-h"|"help")
            _about_interface_info_box
            return 0
            ;;
    esac

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