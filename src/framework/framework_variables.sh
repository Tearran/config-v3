#!/usr/bin/env bash

initialize_framework_variables() {

	local options="$1"
	case "$options" in
		help)  _about_variables ;;
		set)   _set_variables ;;
		unset) _unset_variables ;;
		*)     _about_variables ;;
	esac

}

_set_paths() {

	SCRIPT_PATH="${BASH_SOURCE[0]}"
	SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
	TOOLS_DIR="${ROOT}/tools"
	# Add more exports as required...

}

_unset_paths() {

	unset SCRIPT_PATH
	unset SCRIPT_NAME
	unset SCRIPT_DIR
	unset ROOT
	unset TOOLS_DIR
}

_about_variables() {
	cat <<EOF
Module Variable Helper
Usage: initialize_paths <options>
Options:
	help   - Show this help message
	set    - Set (export) module variables
	unset  - Unset module variables
EOF

}
