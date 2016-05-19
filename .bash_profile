# Load the git branch prompt script.
if [ -f ~/.git-prompt.sh ]; then
. ~/.git-prompt.sh
fi

# Load Bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Load Bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# Git Prompt Configuration
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCOLORHINTS="true"
PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'

# Augment PATH variable
export PATH="./.bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/sbin:$PATH"

# RBENV configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#GOLANG configuration
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
