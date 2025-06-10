#!/usr/bin/env bash
# STUB TEST for checkpoint. Replace with real tests.

set -euo pipefail

declare -A module_options

if [[ "tools/stub_missing_tests.sh" == "tools/stub_missing_tests.sh" ]]; then
	DEBUG="${DEBUG:-true}"
	source "src/initialize/checkpoint.sh"
	checkpoint reset
	checkpoint mark "Unit-test"
	checkpoint total
	exit 0
fi

