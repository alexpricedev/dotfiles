# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH=$PATH:$HOME/.maestro/bin

# Entire CLI shell completion
if command -v entire &> /dev/null; then
    source <(entire completion bash)
fi
