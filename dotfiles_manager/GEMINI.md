<!-- It looks like you're in a Go project. Here's a summary of the project to provide context to Gemini.
-->
# Project Overview

This project is a dotfiles manager written in Go. It is a replacement for the original `installAll.nu` script. The manager traverses a directory structure, copies files, and handles special cases like OS-specific configurations and templating.

## Key Technologies

- **Go:** The core logic is written in Go.
- **Nushell:** The original script was written in Nushell, and the Go implementation is designed to be a replacement for it.
- **YAML:** Used for configuration files (`.rules.yaml`).
- **Go Templates:** Used for templating dotfiles.

## Architecture

The project is structured into several packages:

- **`main`:** The entry point of the application.
- **`internal/installer`:** The core logic for the dotfiles installation. It is responsible for traversing the source directory, copying files, and handling special cases like install scripts and rule files.
- **`internal/context`:** Provides information about the current environment, such as the operating system.
- **`internal/rules`:** Handles the logic for parsing and applying rules from `.rules.yaml` files.
- **`internal/stringutil`:** Provides string utility functions.

# Building and Running

To build and run the project, you can use the following commands:

```sh
# Build the project
go build

# Run the project
./dotfiles
```

# Development Conventions

- **Code Style:** The code follows standard Go formatting.
- **Testing:** There are no tests in the project yet. This is a TODO.
- **Dependencies:** Dependencies are managed using Go modules.
