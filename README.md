# dotfiles

Personal configuration files and shell setup.

## Latest Version

This version focuses on IoT and Raspberry Pi compatibility, optimized for lightweight environments and embedded systems.

## Tools

- **tmux** - Terminal multiplexer for persistent sessions
- **bash** - Shell configuration and aliases  
- **vim** - Text editor setup and plugins

## Setup

There is a script (`symlink.sh`) to link the dotfiles to the right place on disk.

Just run `bash symlink.sh` to make it run.

Then run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install the tmux package manager.

When inside a new (or resourced) tmux session do `ctrl-b + I` to install the plugins.

## MCP

Claude Code commands:
* `claude mcp add playwright npx '@playwright/mcp@latest -s user'`
* `claude mcp add instant -s user -t http https://mcp.instantdb.com/mcp`
