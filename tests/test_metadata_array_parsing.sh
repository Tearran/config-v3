#!/usr/bin/env bash
set -euo pipefail


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	declare -A module_options
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	source "$script_dir/../lib/armbian-config/module_options_arrays.sh" || exit 1
	source "$script_dir/../src/framework/metadata_array_parsing.sh" || exit 2
	_merge_metadata_arrays framework_options framework_helpers
	_metadata_md_table module_options
	(( ${#module_options[@]} > 0 )) && exit 0 || exit 3
fi
