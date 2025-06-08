#!/usr/bin/env bash
set -euo pipefail


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	source "$script_dir/../lib/module_options_arrays.sh"
	source "$script_dir/../src/framework/interface_yes_no_box.sh"

	DIALOG="${DIALOG:-whiptail}"
	interface_yes_no "Do you want to continue?" _process_yes_no
fi
