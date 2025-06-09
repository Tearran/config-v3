#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="./src"
TEST_DIR="./testing"

find "$SRC_DIR" -type f -name "*.sh" | while read -r module; do
	mod_base=$(basename "$module" .sh)
	test_real="$TEST_DIR/test_${mod_base}.sh"
	test_stub="$TEST_DIR/test_${mod_base}.stub.sh"

	# Only create stub if neither real test nor stub exists
	if [[ ! -f "$test_real" ]] && [[ ! -f "$test_stub" ]]; then
		mkdir -p "$(dirname "$test_stub")"
		cat > "$test_stub" <<EOF
#!/usr/bin/env bash
# STUB TEST for $mod_base. Replace with real tests.
set -euo pipefail

echo "WARNING: This is a stub test for $mod_base."
# TODO: Replace this stub with actual tests.
exit 1
EOF
		chmod +x "$test_stub"
		echo "Created test stub: $test_stub"
	fi
done