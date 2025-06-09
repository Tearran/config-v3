<p align="center">
  <a href="#build-framework">
    <img src="https://raw.githubusercontent.com/armbian/configng/main/share/icons/hicolor/scalable/configng-tux.svg" width="128" alt="Armbian Config Logo" />
  </a><br>
  <strong>Armbian Config: The Next Generation V3</strong><br>
  <br>
</p>

# armbian-config (config-v3)

## Overview

**armbian-config** is a system configuration tool for Armbian-based systems. It helps users set up and manage system settings through a simple, interactive interface.

It supports command-line (CLI) and text user interfaces (TUI).

---

## Scope and Responsibilities

- **armbian-config operates only in image-space.**  
  It is used exclusively on a running Armbian system and does **not** participate in the image build process. It does **not** affect image creation or customization at build time.

- **Image build changes belong to the build scripts.**  
  If you wish to change the default contents, packages, or configurations included in an Armbian image before it is built, those changes must be made in the Armbian build scripts—not in armbian-config.

- **Limit feature requests and bug reports to image-space actions.**  
  Feature requests or bug reports for armbian-config should only involve tasks that can be changed or applied on a running system. Requests relating to image creation or build-time customization should be directed to the Armbian build system.

---

## What armbian-config (config-v3) **Is**

- **A Framework for System Configuration:**  
  Provides a collection of reusable Bash modules and helpers for managing and automating configuration tasks on Armbian systems.

- **Interface-Agnostic:**  
  Separates backend configuration logic from user interface code, enabling the same procedures to be accessed via CLI, TUI (text user interface), and future GUI implementations.

- **Modular and Extensible:**  
  Encourages the use of distinct, well-documented modules for each configuration area, facilitating easier maintenance and contribution.

- **Testable:**  
  Built with unit testing and automation in mind, allowing for reliable operation and easier validation of changes.

- **Documentation-Focused:**  
  Provides extensive documentation and in-line help for modules and commands, lowering the barrier for both users and contributors.

---

## Goals

- **Migrate and Refactor:**  
  Transition legacy code and features into a standard, modern development structure.

- **Promote Code Reuse:**  
  Encourage modular, reusable Bash code for consistent configuration handling.

- **Enable Testing:**  
  Facilitate robust unit and integration testing for all modules and helpers.

- **Support Automation and Multiple UIs:**  
  Clean separation of backend configuration from interface logic to allow for both automation and various user-facing interfaces.

---
