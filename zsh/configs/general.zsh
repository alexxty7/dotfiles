# General ZSH configurations
export EDITOR="vim"

## Command history configuration
HISTFILE=~/.zhistory
HISTSIZE=20000
SAVEHIST=20000

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
