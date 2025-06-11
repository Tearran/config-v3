#!/usr/bin/env bash
# Template for framework variables in entrypoint binaries

SCRIPT_PATH="${BASH_SOURCE[0]}"
SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
TOOLS_DIR="${ROOT}/tools"
# Add more exports as required...


_unset_paths() {

	unset SCRIPT_PATH
	unset SCRIPT_NAME
	unset SCRIPT_DIR
	unset ROOT
	unset TOOLS_DIR
}
