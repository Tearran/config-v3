#!/usr/bin/env bash

# Usage: interface_box_colors <action> [color_code]
# Actions: help | set | unset

interface_box_colors() {
    local action="$1"
    shift
    case "$action" in
        help)  _about_interface_box_colors ;;
        set)   _set_interface_box_colors "$@" ;;
        unset) _unset_interface_box_colors ;;
        *)     _about_interface_box_colors ;;
    esac
}

_set_interface_box_colors() {
    local color_code="$1"
    if [ -z "$color_code" ]; then
        echo "Usage: interface_box_colors set <color_code>"
        return 1
    fi
    if [ "$DIALOG" = "whiptail" ]; then
        _newt_colors "$color_code"
    elif [ "$DIALOG" = "dialog" ]; then
        _term_colors "$color_code"
    else
        echo "Invalid dialog type: $DIALOG"
        return 1
    fi
}

_unset_interface_box_colors() {
    # Reset colors for both dialog and whiptail
    if [ "$DIALOG" = "whiptail" ] || [ "$DIALOG" = "dialog" ]; then
        echo -e "\e[0m"
        # Move cursor to bottom of terminal
        if command -v tput >/dev/null; then
            tput cup "$(($(tput lines)-1))" 0
        else
            # Fallback: print enough newlines
            for i in {1..10}; do echo; done
        fi
    fi
    unset NEWT_COLORS
}

_newt_colors() {
    local color_code="$1"
    local color
    case "$color_code" in
        0) color="black" ;;
        1) color="red" ;;
        2) color="green" ;;
        3) color="yellow" ;;
        4) color="blue" ;;
        5) color="magenta" ;;
        6) color="cyan" ;;
        7) color="white" ;;
        8) color="black" ;;
        9) color="red" ;;
        *) return 1 ;;
    esac
    export NEWT_COLORS="root=,$color"
}

_term_colors() {
    local color_code="$1"
    local color
    case "$color_code" in
        0) color="\e[40m" ;; # black
        1) color="\e[41m" ;; # red
        2) color="\e[42m" ;; # green
        3) color="\e[43m" ;; # yellow
        4) color="\e[44m" ;; # blue
        5) color="\e[45m" ;; # magenta
        6) color="\e[46m" ;; # cyan
        7) color="\e[47m" ;; # white
        8) color="\e[100m" ;; # bright black / gray
        9) color="\e[101m" ;; # bright red
        *)
            echo "Invalid color code"
            return 1
            ;;
    esac
    echo -e "$color"
}

_about_interface_box_colors() {
    cat <<EOF
interface_box_colors module
Usage: interface_box_colors <action> [color_code]
Actions:
    help       - Show this help message
    set        - Set interface colors for dialog/whiptail (requires color_code)
    unset      - Reset interface colors to default
Examples:
    interface_box_colors set 2    # Set green background
    interface_box_colors unset    # Reset to default
EOF
}
