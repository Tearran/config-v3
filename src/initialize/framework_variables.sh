#!/bin/bash

initialize_framework_variables() {

	local action="$1"
	case "$action" in
		help)  _about_variables ;;
		set)   _set_variables ;;
		unset) _unset_variables ;;
		*)     _about_variables ;;
	esac

}

_set_variables() {

	export SCRIPT_PATH="${BASH_SOURCE[0]}"
	export SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
	export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	export CONF_FILE="${SCRIPT_DIR}/${SCRIPT_NAME%.sh}.conf"
	export ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
	export MODULES_DIR="${ROOT}/src/modules"
	export TOOLS_DIR="${ROOT}/tools"
	# Add more exports as required...

}

_unset_variables() {

	unset SCRIPT_PATH
	unset SCRIPT_NAME
	unset SCRIPT_DIR
	unset CONF_FILE
	unset ROOT
	unset MODULES_DIR
	unset TOOLS_DIR
}

_about_variables() {
	cat <<EOF
Module Variable Helper
Usage: initialize_framework_variables <action>
Options:
	help   - Show this help message
	set    - Set (export) module variables
	unset  - Unset module variables
EOF

}
