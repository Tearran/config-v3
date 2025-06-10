#!/usr/bin/env bash

initialize_interface() {
	local options="$1"

	case "$options" in

		help)
		_about_initialize_interface
		;;
		*)
		# Set dialog tool hierarchy based on environment
		if [[ -x "$(command -v whiptail)" ]]; then
			DIALOG="whiptail"
		elif [[ -x "$(command -v dialog)" ]]; then
			DIALOG="dialog"
		else
			#die "TUI unavailable"
			echo "TUI unavailable"
			exit 1
		fi
		checkpoint debug "Initialized (TUI) text user interface is ($DIALOG)..."
		;;
	esac

}


function _about_initialize_interface() {
	cat <<EOF
Usage: initialize_interface

EOF

}

