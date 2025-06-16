# ----------------- Setup -----------------

# Bash prompt
PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[93m\]\h\[\e[0m\]: \[\e[96;3m\]\w\n\[\e[0;95m\]>\[\e[0m\] '

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
