#!/usr/bin/env bash
set -euo pipefail

SRC_ROOT="./src"
LIB_ROOT="./lib"
META_ARRAY_FILE="$LIB_ROOT/framework_options.sh"

echo "declare -A framework_options=(" > "$META_ARRAY_FILE"

for module_meta in "$SRC_ROOT"/*/*.conf; do
    [[ -e "$module_meta" ]] || continue
    module_name=$(basename "$module_meta" .conf)
    while IFS='=' read -r key value; do
        [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue # skip comments/empty
        printf '    ["%s,%s"]="%s"\n' "$module_name" "$key" "$value" >> "$META_ARRAY_FILE"
    done < "$module_meta"
done

echo ")" >> "$META_ARRAY_FILE"
echo "framework_options array written to $META_ARRAY_FILE"
