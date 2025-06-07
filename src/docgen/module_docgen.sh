module_docgen() {
    case "$1" in
        md|markdown)
            _metadata_md_table module_options > doc.md
            ;;
        help)
            _metadata_help module_options
            ;;
        *)
            echo "Usage: module_docgen {md|help}" >&2
            return 1
            ;;
    esac
}