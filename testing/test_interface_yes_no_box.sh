#!/usr/bin/env bash
set -euo pipefail

# Only run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	DIALOG="${DIALOG:-whiptail}"
	source ./src/framework/interface_yes_no_box.sh
	interface_yes_no help || exit 1
	interface_yes_no "${1:-Are you sure?}" _process_yes_no
fi