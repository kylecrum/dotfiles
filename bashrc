source ~/.colors;
source ~/.exports;
source ~/.aliases;

eval "$(rbenv init -)"
eval "$(nodenv init -)"
bind 'set completion-ignore-case on'

# `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
  __git_complete gco _git_checkout
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

[[ -f ~/.nodenv/completions/nodenv.bash ]] && source ~/.nodenv/completions/nodenv.bash

# Include your own customizations!
[[ -f ~/.bash.local ]] && source ~/.bash.local

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
