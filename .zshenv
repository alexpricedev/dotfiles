# ~/.zshenv — sourced by zsh in ALL modes (login, non-login, interactive,
# non-interactive). Used so tools like Conductor that invoke scripts under
# zsh inherit the same PATH as an interactive bash terminal.
#
# Keep this file PATH/exports only — no prompts, aliases, or completion.

# ----------------- PATH basics -----------------
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ----------------- Homebrew -----------------
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ----------------- Runtimes -----------------
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$PATH:$HOME/.maestro/bin"
