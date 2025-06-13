#!/usr/bin/env bash
set -euo pipefail

# Example usage: Only run if called directly, not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	DIALOG="${DIALOG:-whiptail}"
	source ./src/framework/interface_ok_box.sh
	interface_ok_box "${1:-help}"
fi
