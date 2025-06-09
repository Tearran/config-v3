declare -n arr="framework_helpers"  # or framework_options, etc.
local key mod
local -A seen_mods=()

# Collect all unique modules (prefix before the comma)
for key in "${!arr[@]}"; do
	mod="${key%%,*}"
	seen_mods["$mod"]=1
done

for mod in "${!seen_mods[@]}"; do
	# Check for feature key
	if [[ ! -v arr["$mod,feature"] ]]; then
		echo "MISSING: $mod,feature"
	fi
done