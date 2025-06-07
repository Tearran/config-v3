#!/usr/bin/env bash
set -e

SRC_ROOT="./src"
LIB_ROOT="./lib"

mkdir -p "$LIB_ROOT"

for DIR in "$SRC_ROOT"/*/; do
    NS=$(basename "$DIR")
    OUT="$LIB_ROOT/$NS.sh"
    : > "$OUT" # clear output
    for f in "$DIR"/*.sh; do
        [[ -e "$f" ]] || continue
        # Optionally, add file header:
        echo "# >>> $f" >> "$OUT"
        cat "$f" >> "$OUT"
        echo -e "\n" >> "$OUT"
    done
done
echo "All namespaces assembled in $LIB_ROOT/"