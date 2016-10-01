# Load the git branch prompt script
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git Prompt Configuration
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCOLORHINTS="true"
# update_terminal_cwd; is a function define in /etc/bashrc
# that preserves the cws when creating new tabs and windows
PROMPT_COMMAND='update_terminal_cwd; __git_ps1 "\w" "\\\$ "'

# Add bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Enable programmable completion features.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
