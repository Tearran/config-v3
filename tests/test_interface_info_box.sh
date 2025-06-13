#!/usr/bin/env bash
set -euo pipefail

# Only run if called directly, not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	source ./src/framework/interface_info_box.sh
	DIALOG="${DIALOG:-whiptail}"
	TITLE="${TITLE:-$DIALOG}"
	echo -e "line one\nline two\nline three" | interface_info_box
fi
