export PATH="/usr/local/bin:$PATH"

export PATH=$PATH:$HOME/.lein/bin
export LEIN_SNAPSHOTS_IN_RELEASE=1

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\$ '

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[[ -s "/Users/rocketspops/.rvm/scripts/rvm" ]] && source "/Users/rocketspops/.rvm/scripts/rvm"

alias aflite="cd /Users/rocketspops/Git/8thlight.com"
alias blogsrc="cd /Users/rocketspops/Git/8th-Light-Blog-Post-Migration"
alias jekyllblog="cd /Users/rocketspops/Git/8thlight.github.com"
alias vimplugs="cd /Users/rocketspops/Git/dotfiles/.vim/bundle/"
