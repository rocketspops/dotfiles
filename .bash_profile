if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\w\[\033[00m\]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\$ '

export PATH=./.bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH

alias be="bundle exec"
alias run_jekyll="be jekyll serve --baseurl '' --watch"
alias sass_jekyll="be sass --watch _sass:stylesheets"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
