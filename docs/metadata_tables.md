### `interface_message`

| Key         | Value |
|-------------|-------|
| maintainer | true |
| extend_disc | Reads input text (either from standard input or as an argument) and presents it to the user with the selected dialog frontend. Supports dialog, whiptail, or plain read/echo. Handles input flexibly and routes output appropriately depending on the tool. |
| port | false |
| group | helpers |
| require_os | Debian Ubuntu Armbian |
| contributor | Tearran |
| unique_id | HEL010 |
| options | <message> |
| description | Displays a message to the user using the configured dialog tool. |
| parent | framework |
| documents | false |
| require_kernel | 5.15+ |
| arch | arm64 armhf x86-64 |

### `_checkpoint_add`

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

### `_set_interface_box_colors`

| Key         | Value |
|-------------|-------|
| unique_id | HEL003 |
| parent | framework |
| options | <color_code> |
| group | helpers |
| documents | false |
| description | Helper to set dialog/whiptail interface colors using a numeric color code. |
| extend_disc | Sets colors for dialog or whiptail interfaces based on numeric code (0-9), mapped to common color names or ANSI escape sequences. |

### `_about_interface_message`

| Key         | Value |
|-------------|-------|
| parent | framework |
| group | helpers |
| documents | false |
| options |  |
| unique_id | HEL011 |
| description | Show help and usage information for the interface_message helper. |
| extend_disc | Outputs usage, available options, and example commands for the interface_message helper function. |

### `checkpoint`

| Key         | Value |
|-------------|-------|
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

| Key         | Value |
|-------------|-------|
| extend_disc | Maps numeric color codes to ANSI escape sequences and outputs them for dialog-based UIs. |
| unique_id | HEL006 |
| options | <color_code> |
| group | helpers |
| parent | framework |
| documents | false |
| description | Internal helper to output ANSI terminal color codes for dialog. |

### `initialize_interface`

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
| unique_id | INI002 |
| port | false |

### `_checkpoint_help`

| Key         | Value |
|-------------|-------|
| documents | false |
| require_kernel | 5.15+ |
| contributor | Tearran |
| options |  |
| arch | arm64 armhf x86-64 |
| group | helpers |
| parent | framework |
| port | false |
| unique_id | HEL016 |
| require_os | Debian Ubuntu Armbian |
| extend_disc | Displays usage instructions, available options, and descriptions for checkpoint timing functions. |
| description | Print help and usage information for the checkpoint module. |
| maintainer | true |

### `_about_initialize_interface`

| Key         | Value |
|-------------|-------|
| group | helpers |
| description | Show help and usage information for the initialize_interface function. |
| unique_id | HEL021 |
| documents | false |
| extend_disc | Outputs usage instructions and available options for the initialize_interface TUI initialization function. |
| parent | framework |
| options |  |

### `_newt_colors`

| Key         | Value |
|-------------|-------|
| parent | framework |
| description | Internal helper to export NEWT_COLORS for whiptail. |
| extend_disc | Maps numeric color codes to whiptail (newt) color names and sets the NEWT_COLORS environment variable. |
| documents | false |
| group | helpers |
| options | <color_code> |
| unique_id | HEL005 |

### `interface_yes_no`

| Key         | Value |
|-------------|-------|
| options | <message> <callback_function>\|help |
| require_kernel | 5.15+ |
| unique_id | HEL012 |
| require_os | Debian Ubuntu Armbian |
| port | false |
| contributor | Tearran |
| description | Show a Yes/No dialog and call a callback function with the result. |
| parent | framework |
| arch | arm64 armhf x86-64 |
| documents | false |
| maintainer | true |
| group | helpers |
| extend_disc | Displays a Yes/No prompt using the configured dialog tool (e.g. whiptail or dialog). On Yes, calls the given callback function with no argument, on No/cancel, calls it with No. Used for confirmation prompts. Allowed callbacks must be listed in allowed_functions. |

### `_set_framework_variables`

| Key         | Value |
|-------------|-------|
| require_kernel | 5.15+ |
| maintainer | true |
| documents | false |
| options |  |
| require_os | Debian Ubuntu Armbian |
| unique_id | HEL001 |
| arch | arm64 armhf x86-64 |
| group | helpers |
| extend_disc | Sets and exports common variables for use within this and dependent modules. Intended for use as a helper action within initialize_framework_framework_variables. |
| contributor | Tearran |
| description | Export and set standard environment and module variables. |
| parent | framework |
| port | false |

### `initialize_framework_variables`

| Key         | Value |
|-------------|-------|
| require_os | Debian Ubuntu Armbian |
| description | Initialize, export, and unset standard variables modules and helpers. |
| documents | false |
| contributor | Tearran |
| maintainer | true |
| options | help set unset |
| require_kernel | 5.15+ |
| group | Initialize |
| unique_id | INI001 |
| arch | arm64 armhf x86-64 |
| extend_disc | Provides a standardized method to set, export, and unset common variables (such as SCRIPT_PATH, SCRIPT_DIR, ROOT, MODULES_DIR, TOOLS_DIR) for use within Armbian ConfigNG modules and helpers. Includes a built-in help action and is intended for use as a base or utility module. |
| parent | framework |
| port | false |

### `sanitize`

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

### `_checkpoint_total`

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

### `_checkpoint_reset`

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

### `interface_menu`

| Key         | Value |
|-------------|-------|
| description | Display a menu using available dialog tools (whiptail, dialog, or read) and call a callback function with the selected option. |
| contributor | Tearran |
| require_kernel | 5.15+ |
| require_os | Debian Ubuntu Armbian |
| extend_disc | Shows a selectable menu using the configured dialog system (whiptail, dialog, or fallback to read). The menu options are dynamically generated from the supplied module or function. On selection, the corresponding callback function is invoked with the user's choice. Used to present interactive menus for module helpers, settings, or tasks. |
| maintainer | true |
| unique_id | HEL008 |
| options | <function_name>\|help |
| arch | arm64 armhf x86-64 |
| port | false |
| parent | framework |
| group | helpers |
| documents | false |

### `_about_interface_menu`

| Key         | Value |
|-------------|-------|
| documents | false |
| extend_disc | Outputs usage, available options, and example commands for the interface_menu helper function. |
| description | Show help and usage information for the interface_menu helper. |
| unique_id | HEL009 |
| parent | framework |
| options |  |
| group | helpers |

### `die`

| Key         | Value |
|-------------|-------|
| extend_disc | Outputs the provided message(s) to standard error and terminates the script. Used for error handling by helper functions and modules. |
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

### `interface_box_colors`

| Key         | Value |
|-------------|-------|
| maintainer | true |
| contributor | Tearran |
| arch | arm64 armhf x86-64 |
| extend_disc | Provides functions to set, unset, and reset terminal UI colors for dialog and whiptail UIs, including cleanup to ensure a visually clean terminal after use. |
| port | false |
| require_os | Debian Ubuntu Armbian |
| documents | false |
| unique_id | INT001 |
| require_kernel | 5.15+ |
| parent | framework |
| group | interface |
| options | help set unset |
| description | Manage dialog and whiptail interface colors for Armbian ConfigNG modules. |

### `_unset_framework_variables`

| Key         | Value |
|-------------|-------|
| extend_disc | Unsets common variables previously exported by _set_framework_variables or initialize_framework_framework_variables. Intended for use as a helper action within initialize_framework_framework_variables. |
| require_kernel | 5.15+ |
| require_os | Debian Ubuntu Armbian |
| group | helpers |
| port | false |
| parent | framework |
| unique_id | HEL002 |
| contributor | Tearran |
| maintainer | true |
| options |  |
| description | Unset standard environment and module variables. |
| documents | false |
| arch | arm64 armhf x86-64 |

### `_about_interface_box_colors`

| Key         | Value |
|-------------|-------|
| parent | framework |
| description | Show help and usage information for interface_box_colors module. |
| documents | false |
| unique_id | HEL007 |
| group | helpers |
| options |  |
| extend_disc | Outputs usage, options, and example commands for the interface_box_colors module. |

### `_about_interface_yes_no`

| Key         | Value |
|-------------|-------|
| extend_disc | Outputs usage, options, and example commands for the interface_yes_no helper function. |
| documents | false |
| options |  |
| unique_id | HEL013 |
| description | Show help and usage information for interface_yes_no helper. |
| group | helpers |
| parent | framework |

### `_unset_interface_box_colors`

| Key         | Value |
|-------------|-------|
| unique_id | HEL004 |
| description | Helper to reset dialog/whiptail interface colors and clean the terminal display. |
| group | helpers |
| options |  |
| extend_disc | Resets terminal to default colors and moves cursor to the bottom to minimize dialog/whiptail display artifacts. Also unsets NEWT_COLORS. |
| documents | false |
| parent | framework |

### `_process_input`

| Key         | Value |
|-------------|-------|
| description | Example callback function for interface_yes_no; processes the Yes/No result. |
| documents | false |
| options |  |
| unique_id | HEL014 |
| group | helpers |
| extend_disc | Called by interface_yes_no with no argument for Yes, or No if cancelled. Customize this function for your own logic. |
| parent | framework |

