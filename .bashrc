# ----------------- Setup -----------------

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[93m\]\h\[\e[0m\]: \[\e[97m\]\w\n\[\e[0;95m\][${PS1_CMD1}]>\[\e[0m\] '

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";




# ----------------- Completion features -----------------

# Enable (installed via: https://repology.org/project/bash-completion/versions)
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Ignore case during tab completion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display all matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Show all matches when multiple possible completions exist
bind "set show-all-if-unmodified on"

# Add trailing slash when completing symlinks to directories
bind "set mark-symlinked-directories on"




# ----------------- Misc. -----------------

# Disable silly macos zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';




# ----------------- Alias -----------------

# Git
alias gb='git branch'
alias gco='git checkout'

# Misc
alias p="cd ~/projects"
alias l="ls -lF"
alias la="ls -laF"
alias ll="la"




# ----------------- Runtimes -----------------
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)" eval 
