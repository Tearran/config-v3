#!/usr/bin/env bash
set -o pipefail



declare -A module_options

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	mkdir -p "$script_dir/../docs"
	source "$script_dir/../lib/armbian-config/module_options_arrays.sh"
	source "$script_dir/../src/framework/metadata_array_parsing.sh"
	_merge_metadata_arrays framework_options framework_helpers
	_metadata_md_table module_options > "$script_dir/../docs/metadata_tables.md"
fi
