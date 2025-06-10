#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="./src"
TEST_DIR="./testing"

find "$SRC_DIR" -type f -name "*.sh" | while read -r module; do
	mod_base=$(basename "$module" .sh)
	# Check for any matching test file (real or stub)
	shopt -s nullglob
	matches=("$TEST_DIR"/test_"$mod_base"*.sh)
	shopt -u nullglob

	if [[ ${#matches[@]} -eq 0 ]]; then
		stubfile="$TEST_DIR/test_${mod_base}.stub.sh"
		cat > "$stubfile" <<EOF
#!/usr/bin/env bash
# STUB TEST for $mod_base. Replace with real tests.
set -euo pipefail

echo "WARNING: This is a stub test for $mod_base."
# TODO: Replace this stub with actual tests.
exit 1
EOF
		chmod +x "$stubfile"
		echo "Created stub: $stubfile"
	fi
done
