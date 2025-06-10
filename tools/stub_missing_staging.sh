#!/usr/bin/env bash
set -euo pipefail

STAGING_DIR="./staging"
TEMPLATE_META="./templates/module_template.meta"

find "$STAGING_DIR" -maxdepth 1 -type f -name "*.sh" ! -name "*.stub.sh" | while read -r module; do
    mod_base=$(basename "$module" .sh)
    stubfile="$STAGING_DIR/test_${mod_base}.stub.sh"
    metafile="$STAGING_DIR/${mod_base}.meta"
    stubmetafile="$STAGING_DIR/${mod_base}.stub.meta"

    # (1) Create stub .sh if missing
    if [[ ! -f "$stubfile" ]]; then
        cat > "$stubfile" <<EOF
#!/usr/bin/env bash
# STUB for $mod_base in staging. Replace with actual content as needed.

set -euo pipefail

if [[ "\${BASH_SOURCE[0]}" == "\${0}" ]]; then
    echo "WARNING: This is a stub for $mod_base in staging."
    echo "Replace this stub with the actual implementation."
    exit 1
fi

EOF
        chmod +x "$stubfile"
        echo "Created stub: $stubfile"
    fi

    # (2) Handle meta files: only create/copy stub.meta if .meta is missing
    if [[ ! -f "$metafile" ]]; then
        if [[ ! -f "$stubmetafile" ]]; then
            cp "$TEMPLATE_META" "$stubmetafile"
            echo "Copied meta template to: $stubmetafile"
        fi
    fi
done