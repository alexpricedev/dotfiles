# dotfiles

Personal configuration files and shell setup.

## Latest Version

This version focuses on IoT and Raspberry Pi compatibility, optimized for lightweight environments and embedded systems.

## Tools

- **tmux** - Terminal multiplexer for persistent sessions
- **bash** - Shell configuration and aliases  
- **vim** - Text editor setup and plugins

## Bash

macOS ships with an old version of bash. Install and switch to the latest:

```sh
# 1. Install latest bash
brew install bash
# 2. Check version (should be 5.x)
/opt/homebrew/bin/bash --version
# 3. Add the new bash to the list of allowed shells
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
# 4. Change your default shell
chsh -s /opt/homebrew/bin/bash
# 5. Verify after opening a new terminal window
echo $SHELL && bash --version
```

## Keyboard

Speed up key repeat below the System Settings minimums:

```sh
# Key repeat rate (lower = faster, GUI min is 2)
defaults write NSGlobalDomain KeyRepeat -int 1
# Delay until repeat (lower = shorter, GUI min is 15)
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

Log out and back in for the change to take effect.

## Setup

There is a script (`symlink.sh`) to link the dotfiles to the right place on disk.

Just run `bash symlink.sh` to make it run.

Then run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install the tmux package manager.

When inside a new (or resourced) tmux session do `ctrl-b + I` to install the plugins.

## MCP

Claude Code commands:
* `claude mcp add browsermcp -s user -- npx -y @browsermcp/mcp@latest`
* `claude mcp add instant -s user -t http https://mcp.instantdb.com/mcp`
