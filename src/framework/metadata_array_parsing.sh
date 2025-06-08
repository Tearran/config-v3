#!/usr/bin/env bash
# shellcheck disable=SC2034

_merge_metadata_arrays() {
	for array_name in "$@"; do
		local -n src="$array_name"
		for key in "${!src[@]}"; do
			module_options["$key"]="${src[$key]}"
		done
	done
}

# Output Markdown table for each module/helper
_metadata_md_table() {
	local -n options_array="$1"
	local -A seen_sections=()

	# Collect all section names (prefix before the first comma)
	for key in "${!options_array[@]}"; do
		section="${key%%,*}"
		seen_sections["$section"]=1
	done

	for section in "${!seen_sections[@]}"; do
		echo "### \`$section\`"
		echo
		echo "| Key         | Value |"
		echo "|-------------|-------|"
		for key in "${!options_array[@]}"; do
			[[ "$key" == "$section,"* ]] || continue
			meta_key="${key#*,}"
			meta_val="${options_array[$key]}"
			# Escape pipes in meta_val for markdown
			meta_val="${meta_val//|/\\|}"
			echo "| $meta_key | $meta_val |"
		done
		echo
	done
}
