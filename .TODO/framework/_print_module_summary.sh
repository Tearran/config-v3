


_print_module_summary() {
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


