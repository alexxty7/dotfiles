source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2

zplug load

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ERL_AFLAGS="-kernel shell_history enabled"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

ensure_tmux_is_running
