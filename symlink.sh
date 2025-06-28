#!/bin/bash

# Dotfiles symlink script
# Usage: `bash symlink.sh`

set -e  # Exit on any error

# Configuration
DOTFILES_DIR="$(pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if dotfiles directory exists
if [[ ! -d "$DOTFILES_DIR" ]]; then
    log_error "Dotfiles directory '$DOTFILES_DIR' not found!"
    exit 1
fi

log_info "Using dotfiles directory: $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"
log_info "Backup directory created: $BACKUP_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir=$(dirname "$target")
    
    # Create target directory if it doesn't exist
    if [[ ! -d "$target_dir" ]]; then
        mkdir -p "$target_dir"
        log_info "Created directory: $target_dir"
    fi
    
    # Backup existing file/symlink
    if [[ -e "$target" || -L "$target" ]]; then
        log_warning "Backing up existing: $target"
        mv "$target" "$BACKUP_DIR/$(basename "$target")"
    fi
    
    # Create symlink
    ln -sf "$source" "$target"
    log_success "Linked: $target -> $source"
}

# Define files to symlink (modify this list for your dotfiles)
# Format: "target_path:source_file_in_dotfiles_dir"
DOTFILES=(
    "$HOME/.bashrc:.bashrc"
    "$HOME/.vimrc:.vimrc"
    "$HOME/.tmux.conf:.tmux.conf"
    "$HOME/projects/CLAUDE.md:CLAUDE.md"
)

log_info "Starting symlink process..."

# Process each dotfile
for entry in "${DOTFILES[@]}"; do
    target="${entry%:*}"
    source_file="$DOTFILES_DIR/${entry#*:}"
    
    if [[ -f "$source_file" ]]; then
        create_symlink "$source_file" "$target"
    else
        log_warning "Source file not found: $source_file (skipping)"
    fi
done

log_success "Dotfiles symlinked successfully!"
log_info "Backup directory: $BACKUP_DIR"

# Check for broken symlinks
log_info "Checking for broken symlinks in home directory..."
find "$HOME" -maxdepth 2 -type l ! -exec test -e {} \; -print 2>/dev/null | while read -r broken_link; do
    log_warning "Broken symlink found: $broken_link"
done

echo
log_info "To remove backups later: rm -rf '$BACKUP_DIR'"
log_info "To verify symlinks: ls -la ~/ | grep ' -> '"
