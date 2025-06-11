## Staging Folder

The `staging/` directory is an isolated workspace for proposed new modules and changes, intended for team review before integration into the main codebase. Content here is never deployed or included in production builds.

### Purpose

- **Module review**: New or updated modules are placed here as pull requests for team review and testing.
- **Metadata validation**: Files with a `.meta` extension are checked by corresponding `test_*` scripts to ensure correct formatting and content.
- **Prototyping**: Experimental helpers or scripts can be developed and revised here without affecting the main `src/` tree. Only reviewed and approved code is promoted.

### Workflow

- Each helper module must have its own executable test script (`test_<name>.sh`).
- The CI workflow `.github/workflows/01_github_workflows_staging.yml` enforces the presence of executable tests. If missing, it suggests using `staging_stub_missing_meta_tests.sh` as a template for a new test script.
- **Nothing in `staging/` is ever installed or included in Armbian image builds.**

**Note:** Use the provided stub script as a starting point for any new module or helper added to `staging/`.