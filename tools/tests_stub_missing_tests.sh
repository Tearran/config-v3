#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="./src/framework"
TEST_DIR="./tests"

for module in "$SRC_DIR"/*.sh; do
	mod_base=$(basename "$module" .sh)
	test_file="$TEST_DIR/test_${mod_base}.sh"
	stub_file="$TEST_DIR/test_${mod_base}.stub.sh"

	# Skip files that are not regular modules (e.g., not .sh, or are hidden)
	[[ ! -f "$module" ]] && continue

	# Check for any test (real or stub)
	if [[ ! -e "$test_file" && ! -e "$stub_file" ]]; then
		cat > "$stub_file" <<EOF
#!/usr/bin/env bash
# STUB TEST for test_${mod_base}. Replace with real tests.

set -euo pipefail

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "WARNING: This is a stub test for test_${mod_base}."
	echo "Replace this stub with actual tests."
	exit 1
fi

EOF
		chmod +x "$stub_file"
		echo "Created stub: $stub_file"
	fi
done
