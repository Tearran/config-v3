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


function options_list() {
	local array_name="$1"
	local usage="$2"
	local -n options_array="$array_name"  # Bash 4.3+ nameref
	local mod_message="Usage: ${0} [$usage] [options]\n\n"
	i=1

	for function_name in "${!options_array[@]}"; do
	# Parse out the function name if your keys are like "foo,description"
	[[ "$function_name" =~ ^([^,]+),feature$ ]] || continue
	fn_name="${BASH_REMATCH[1]}"
	type="feature" # or get from your array if stored
	if [[ "$type" == "feature" ]]; then
		example="${options_array["$fn_name,options"]}"
		mod_message+="$i. ${options_array["$fn_name,description"]}\n\t${options_array["$fn_name,unique_id"]} $example\n\n"
		((i++))
	fi
	done
	echo -e "$mod_message"
}