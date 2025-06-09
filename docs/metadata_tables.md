### `_process_yes_no`

**unique_id:** `HEL012`

| Key         | Value |
|-------------|-------|
| unique_id | HEL012 |
| options |  |
| feature | _process_yes_no |
| extend_docs | false |
| extend_disc | Called by interface_yes_no with no argument for Yes, or No if cancelled. Customize this function for your own logic. |
| group | helpers |
| parent | framework |
| description | Example callback function for interface_yes_no; processes the Yes/No result. |
### `interface_message`

**unique_id:** `HEL008`

| Key         | Value |
|-------------|-------|
| maintainer | true |
| extend_disc | Reads input text (either from standard input or as an argument) and presents it to the user with the selected dialog frontend. Supports dialog, whiptail, or plain read/echo. Handles input flexibly and routes output appropriately depending on the tool. |
| port | false |
| group | helpers |
| require_os | Debian Ubuntu Armbian |
| contributor | Tearran |
| unique_id | HEL008 |
| options | <message> |
| description | Displays a message to the user using the configured dialog tool. |
| parent | framework |
| feature | interface_message |
| require_kernel | 5.15+ |
| extend_docs | false |
| arch | arm64 armhf x86-64 |
### `_checkpoint_add`

**unique_id:** `HEL015`

| Key         | Value |
|-------------|-------|
| unique_id | HEL015 |
| extend_disc | Prints message and elapsed time if in debug mode, or marks a UI milestone if in UX mode. |
| description | Add a checkpoint mark or debug output with optional elapsed time. |
| contributor | Tearran |
| port | false |
| documents | false |
| maintainer | true |
| options | <type> <message> |
| group | helpers |
| require_kernel | 5.15+ |
| parent | framework |
| require_os | Debian Ubuntu Armbian |
| arch | arm64 armhf x86-64 |
| feature | _checkpoint_add |
### `_set_interface_box_colors`

**unique_id:** `HEL001`

| Key         | Value |
|-------------|-------|
| unique_id | HEL001 |
| parent | framework |
| options | <color_code> |
| extend_docs | false |
| feature | _set_interface_box_colors |
| group | helpers |
| description | Helper to set dialog/whiptail interface colors using a numeric color code. |
| extend_disc | Sets colors for dialog or whiptail interfaces based on numeric code (0-9), mapped to common color names or ANSI escape sequences. |
### `_about_interface_message`

**unique_id:** `HEL009`

| Key         | Value |
|-------------|-------|
| parent | framework |
| group | helpers |
| options |  |
| unique_id | HEL009 |
| feature | _about_interface_message |
| description | Show help and usage information for the interface_message helper. |
| extend_docs | false |
| extend_disc | Outputs usage, available options, and example commands for the interface_message helper function. |
### `checkpoint`

**unique_id:** `TIM001`

| Key         | Value |
|-------------|-------|
| feature | checkpoint |
| documents | false |
| parent | framework |
| maintainer | true |
| options | debug help mark reset total |
| port | false |
| require_os | Debian Ubuntu Armbian |
| extend_disc | Provides timing, debugging, and progress checkpoint utilities for Bash modules. Supports debug timing, UX/UI marks, and elapsed time reporting for module development and diagnostics. |
| group | timing |
| contributor | Tearran |
| arch | arm64 armhf x86-64 |
| unique_id | TIM001 |
| description | Lightweight checkpoint and timing framework for Armbian ConfigNG modules. |
| require_kernel | 5.15+ |
### `_term_colors`

**unique_id:** `HEL004`

| Key         | Value |
|-------------|-------|
| extend_disc | Maps numeric color codes to ANSI escape sequences and outputs them for dialog-based UIs. |
| unique_id | HEL004 |
| options | <color_code> |
| extend_docs | false |
| feature | _term_colors |
| group | helpers |
| parent | framework |
| description | Internal helper to output ANSI terminal color codes for dialog. |
### `initialize_interface`

**unique_id:** `INI001`

| Key         | Value |
|-------------|-------|
| parent | framework |
| group | Initialize |
| documents | false |
| maintainer | true |
| require_os | Debian Ubuntu Armbian |
| options | help |
| contributor | Tearran |
| extend_disc | Detects and configures available dialog tools (whiptail or dialog) for text-based user interfaces. Sets the DIALOG environment variable based on tool availability hierarchy. Provides help information and error handling when no suitable TUI tools are found. |
| description | Initialize text user interface (TUI) dialog tool detection and configuration. |
| require_kernel | 5.15+ |
| arch | arm64 armhf x86-64 |
| unique_id | INI001 |
| feature | initialize_interface |
| port | false |
### `_checkpoint_help`

**unique_id:** `HEL016`

| Key         | Value |
|-------------|-------|
| documents | false |
| require_kernel | 5.15+ |
| contributor | Tearran |
| options |  |
| arch | arm64 armhf x86-64 |
| feature | _checkpoint_help |
| group | helpers |
| parent | framework |
| port | false |
| unique_id | HEL016 |
| require_os | Debian Ubuntu Armbian |
| extend_disc | Displays usage instructions, available options, and descriptions for checkpoint timing functions. |
| description | Print help and usage information for the checkpoint module. |
| maintainer | true |
### `_about_initialize_interface`

**unique_id:** `HEL021`

| Key         | Value |
|-------------|-------|
| group | helpers |
| description | Show help and usage information for the initialize_interface function. |
| unique_id | HEL021 |
| feature | _about_initialize_interface |
| documents | false |
| extend_disc | Outputs usage instructions and available options for the initialize_interface TUI initialization function. |
| parent | framework |
| options |  |
### `_newt_colors`

**unique_id:** `HEL003`

| Key         | Value |
|-------------|-------|
| extend_docs | false |
| parent | framework |
| description | Internal helper to export NEWT_COLORS for whiptail. |
| extend_disc | Maps numeric color codes to whiptail (newt) color names and sets the NEWT_COLORS environment variable. |
| feature | _newt_colors |
| group | helpers |
| options | <color_code> |
| unique_id | HEL003 |
### `interface_yes_no`

**unique_id:** `HEL010`

| Key         | Value |
|-------------|-------|
| options | <message> <callback_function>\|help |
| require_kernel | 5.15+ |
| unique_id | HEL010 |
| require_os | Debian Ubuntu Armbian |
| port | false |
| contributor | Tearran |
| description | Show a Yes/No dialog and call a callback function with the result. |
| parent | framework |
| feature | interface_yes_no |
| arch | arm64 armhf x86-64 |
| maintainer | true |
| extend_docs | false |
| group | helpers |
| extend_disc | Displays a Yes/No prompt using the configured dialog tool (e.g. whiptail or dialog). On Yes, calls the given callback function with no argument, on No/cancel, calls it with No. Used for confirmation prompts. Allowed callbacks must be listed in allowed_functions. |
### `sanitize`

**unique_id:** `HEL019`

| Key         | Value |
|-------------|-------|
| port | false |
| require_kernel | 5.15+ |
| group | helpers |
| unique_id | HEL019 |
| contributor | Tearran |
| options | <argument> |
| documents | false |
| extend_disc | Checks that the provided argument consists solely of alphanumeric characters, underscores, and equals signs. If the input is invalid, it calls the die helper to terminate execution with an error message. |
| arch | arm64 armhf x86-64 |
| description | Sanitizes input to ensure only allowed characters are present. |
| require_os | Debian Ubuntu Armbian |
| parent | framework |
| maintainer | true |
| feature | sanitize |
### `_checkpoint_total`

**unique_id:** `HEL018`

| Key         | Value |
|-------------|-------|
| require_kernel | 5.15+ |
| unique_id | HEL018 |
| arch | arm64 armhf x86-64 |
| require_os | Debian Ubuntu Armbian |
| documents | false |
| port | false |
| parent | framework |
| maintainer | true |
| options |  |
| extend_disc | Prints the total elapsed time, resets timing, and outputs in debug mode for summary diagnostics. |
| contributor | Tearran |
| description | Show total time elapsed since last reset and reset timing. |
| group | helpers |
| feature | _checkpoint_total |
### `_checkpoint_reset`

**unique_id:** `HEL017`

| Key         | Value |
|-------------|-------|
| unique_id | HEL017 |
| description | Reset the checkpoint timing start point. |
| parent | framework |
| options |  |
| contributor | Tearran |
| group | helpers |
| documents | false |
| maintainer | true |
| require_os | Debian Ubuntu Armbian |
| require_kernel | 5.15+ |
| arch | arm64 armhf x86-64 |
| port | false |
| extend_disc | Sets the internal timing reference for elapsed time calculations. Used for both start and reset. |
| feature | _checkpoint_reset |
### `interface_menu`

**unique_id:** `HEL006`

| Key         | Value |
|-------------|-------|
| description | Display a menu using available dialog tools (whiptail, dialog, or read) and call a callback function with the selected option. |
| contributor | Tearran |
| require_kernel | 5.15+ |
| feature | interface_menu |
| extend_docs | false |
| require_os | Debian Ubuntu Armbian |
| extend_disc | Shows a selectable menu using the configured dialog system (whiptail, dialog, or fallback to read). The menu options are dynamically generated from the supplied module or function. On selection, the corresponding callback function is invoked with the user's choice. Used to present interactive menus for module helpers, settings, or tasks. |
| maintainer | true |
| unique_id | HEL006 |
| options | <function_name>\|help |
| arch | arm64 armhf x86-64 |
| port | false |
| parent | framework |
| group | helpers |
### `_about_interface_menu`

**unique_id:** `HEL007`

| Key         | Value |
|-------------|-------|
| extend_disc | Outputs usage, available options, and example commands for the interface_menu helper function. |
| description | Show help and usage information for the interface_menu helper. |
| unique_id | HEL007 |
| extend_docs | false |
| parent | framework |
| feature | _about_interface_menu |
| options |  |
| group | helpers |
### `_merge_metadata_arrays`

**unique_id:** `HEL014`

| Key         | Value |
|-------------|-------|
| extend_disc | Iterates over provided associative arrays and merges their key-value pairs into the global module_options array, with later arrays overriding earlier keys. Simplifies metadata management across modules. |
| description | Merge multiple associative arrays into the global module_options array |
| extend_docs | false |
| port | false |
| require_kernel | 5.15+ |
| parent | framework |
| unique_id | HEL014 |
| group | helpers |
| maintainer | true |
| feature | _merge_metadata_arrays |
| require_os | Debian Ubuntu Armbian |
| options | <array_names...> |
| contributor | Tearran |
| arch | arm64 armhf x86-64 |
### `die`

**unique_id:** `HEL020`

| Key         | Value |
|-------------|-------|
| extend_disc | Outputs the provided message(s) to standard error and terminates the script. Used for error handling by helper functions and modules. |
| feature | die |
| description | Prints an error message to stderr and exits with code 1. |
| contributor | Tearran |
| group | helpers |
| options | <message> |
| arch | arm64 armhf x86-64 |
| maintainer | true |
| require_kernel | 5.15+ |
| require_os | Debian Ubuntu Armbian |
| unique_id | HEL020 |
| port | false |
| documents | false |
| parent | framework |
### `_metadata_md_table`

**unique_id:** `HEL013`

| Key         | Value |
|-------------|-------|
| options | <array_name> |
| parent | framework |
| arch | arm64 armhf x86-64 |
| contributor | Tearran |
| port | false |
| extend_docs | false |
| require_kernel | 5.15+ |
| require_os | Debian Ubuntu Armbian |
| maintainer | true |
| unique_id | HEL013 |
| description | Output Markdown table for module metadata arrays |
| group | helpers |
| extend_disc | Outputs a GitHub-flavored Markdown table for the provided associative array of metadata or options, grouping by section. Useful for automated documentation generation and readability. |
| feature |  |
### `interface_box_colors`

**unique_id:** `INT001`

| Key         | Value |
|-------------|-------|
| feature | interface_box_colors |
| extend_docs | false |
| maintainer | true |
| contributor | Tearran |
| arch | arm64 armhf x86-64 |
| extend_disc | Provides functions to set, unset, and reset terminal UI colors for dialog and whiptail UIs, including cleanup to ensure a visually clean terminal after use. |
| port | false |
| require_os | Debian Ubuntu Armbian |
| unique_id | INT001 |
| require_kernel | 5.15+ |
| parent | framework |
| group | interface |
| options | help set unset |
| description | Manage dialog and whiptail interface colors for Armbian ConfigNG modules. |
### `_about_interface_box_colors`

**unique_id:** `HEL005`

| Key         | Value |
|-------------|-------|
| parent | framework |
| extend_docs | false |
| description | Show help and usage information for interface_box_colors module. |
| _term_colors | _about_interface_box_colors |
| unique_id | HEL005 |
| group | helpers |
| options |  |
| extend_disc | Outputs usage, options, and example commands for the interface_box_colors module. |
### `_about_interface_yes_no`

**unique_id:** `HEL011`

| Key         | Value |
|-------------|-------|
| extend_disc | Outputs usage, options, and example commands for the interface_yes_no helper function. |
| options |  |
| extend_docs | false |
| feature | _about_interface_yes_no |
| unique_id | HEL011 |
| description | Show help and usage information for interface_yes_no helper. |
| group | helpers |
| parent | framework |
### `_unset_interface_box_colors`

**unique_id:** `HEL002`

| Key         | Value |
|-------------|-------|
| unique_id | HEL002 |
| description | Helper to reset dialog/whiptail interface colors and clean the terminal display. |
| feature | _unset_interface_box_colors |
| group | helpers |
| options |  |
| extend_disc | Resets terminal to default colors and moves cursor to the bottom to minimize dialog/whiptail display artifacts. Also unsets NEWT_COLORS. |
| extend_docs | false |
| parent | framework |
