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

_metadata_md_table() {
	local -n options_array="$1"
	local -A seen_sections=()
	local key section meta_key meta_val
	# Collect all section names (prefix before the first comma)
	for key in "${!options_array[@]}"; do
		section="${key%%,*}"
		seen_sections["$section"]=1
	done

	for section in "${!seen_sections[@]}"; do
		echo "### \`$section\`"
		echo

		# Try to get unique_id if present
		local uid_key="$section,unique_id"
		local uid_val="${options_array[$uid_key]:-(none)}"
		echo "**unique_id:** \`$uid_val\`"
		echo

		echo "| Key         | Value |"
		echo "|-------------|-------|"
		local found_uid=false
		for key in "${!options_array[@]}"; do
			[[ "$key" == "$section,"* ]] || continue
			meta_key="${key#*,}"
			meta_val="${options_array[$key]}"
			# Escape pipes in meta_val for markdown
			meta_val="${meta_val//|/\\|}"
			echo "| $meta_key | $meta_val |"
			[[ "$meta_key" == "unique_id" ]] && found_uid=true
		done

		if [[ "$found_uid" == false ]]; then
			echo "| unique_id | (MISSING) |"
		fi
	done
}


search_module_metadata() {
	local prefix="$1"   # e.g., "_set_interface_box_colors"
	# Loop over all keys in module_options
	for key in "${!module_options[@]}"; do
		# Check if key starts with the prefix followed by a comma
		if [[ "$key" == "$prefix,"* ]]; then
			printf "%s = %s\n" "$key" "${module_options[$key]}"
		fi
	done
}