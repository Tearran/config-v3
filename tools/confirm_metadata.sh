#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="./src"

CONF_TEMPLATE='[]
feature=
description=
extend_disc=
extend_docs=
options=
parent=
group=
contributor=
maintainer=
arch=arm64 armhf x86-64
require_os=Debian Ubuntu Armbian
require_kernel=5.15+
port=
'

find "$SRC_DIR" -type f -name "*.sh" | while read -r shfile; do
    dir=$(dirname "$shfile")
    base=$(basename "$shfile" .sh)
    conf="$dir/$base.conf"
    fixconf="$dir/fix_${base}_missing.conf"

    if [[ ! -f "$conf" ]]; then
        if [[ ! -f "$fixconf" ]]; then
            echo "No conf for $shfile, creating $fixconf"
            printf "%s" "$CONF_TEMPLATE" > "$fixconf"
        else
            echo "$fixconf already exists."
        fi
    fi
done
