#!/usr/bin/env bash

set -euo pipefail

declare -A module_options

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	source "$script_dir/../lib/module_options_arrays.sh"
	source "$script_dir/../src/framework/metadata_array_parsing.sh"
	source "$script_dir/../src/docgen/module_docgen.sh"
	module_docgen
fi
