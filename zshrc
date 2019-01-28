source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug "paulirish/git-open", as:plugin

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexandr/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/alexandr/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexandr/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/alexandr/google-cloud-sdk/completion.zsh.inc'; fi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

ensure_tmux_is_running
