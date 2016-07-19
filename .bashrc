# Add bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Load the git branch prompt script
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Git Prompt Configuration
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCOLORHINTS="true"
PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'

# Enable programmable completion features.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
