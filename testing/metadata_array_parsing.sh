#!/usr/bin/env bash
set -euo pipefail


declare -A module_options

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	source "$script_dir/../lib/module_options_arrays.sh"
	source "$script_dir/../src/framework/metadata_array_parsing.sh"
	_merge_metadata_arrays framework_options framework_helpers
	#_metadata_md_table module_options > "$script_dir/../docs/metadata_tables.md"
fi



print_module_summary() {
    local -n arr="$1"
    local key mod
    local -A seen_mods=()

    # Collect all unique modules (prefix before the comma)
    for key in "${!arr[@]}"; do
        mod="${key%%,*}"
        seen_mods["$mod"]=1
    done

    for mod in "${!seen_mods[@]}"; do
        # Prefer 'desc', fall back to 'description'
        local desc="${arr["$mod,desc"]:-${arr["$mod,description"]}}"
        local unique_id="${arr["$mod,unique_id"]}"
        local feature="${arr["$mod,feature"]}"
        local options="${arr["$mod,options"]}"

        # Only print if we have a unique_id and desc/description
        if [[ -n "$unique_id" && -n "$desc" ]]; then
            echo -e "${desc} - ${unique_id}"
            echo "  ${feature} ${options}"
            echo
        fi
    done
}

print_module_summary module_options
