eval export HOMEBREW_PREFIX="/Users/rodel.cabubas/homebrew";
export HOMEBREW_CELLAR="/Users/rodel.cabubas/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/Users/rodel.cabubas/homebrew";
export PATH="/opt/homebrew/bin:$PATH";
export MANPATH="/Users/rodel.cabubas/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/Users/rodel.cabubas/homebrew/share/info:${INFOPATH:-}";
eval "$(/opt/homebrew/bin/brew shellenv)"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(oh-my-posh init bash --config ~/mytheme.omp.json)"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# gpg stuff
GPG_TTY=$(tty)
export GPG_TTY

alias lg="lazygit"
