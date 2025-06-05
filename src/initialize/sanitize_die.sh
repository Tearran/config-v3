#!/usr/bin/env bash

sanitize() {
	[[ "$1" =~ ^[a-zA-Z0-9_=]+$ ]] && echo "$1" || die "Invalid argument: '$1'"
}


die() {
	(( $# )) && echo "$@" >&2
	exit 1
}
