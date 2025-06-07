## Directory Structure

- `src/` — All production code and configs.
    - `framework/` — Core variables, shared framework logic, and reusable helpers (including metadata/help parsers).
    - `initialize/` — Early-stage checks, TUI setup, and error handling.
    - `software/` — Package and container management.
    - `docgen/` — Scripts and thin wrappers for automated documentation generation (sources helpers from `framework/`).
- `templates/` — Skeleton files for new modules/configs.
- `testing/` — Manual and automated test scripts.
- `tools/` — Build and assembly scripts (e.g., for combining arrays or assembling source files).