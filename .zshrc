# stuff
zstyle :compinstall filename '/Users/alex/.zshrc'

# brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
compinit

# alias
alias grep='grep --color=auto'
alias vim='nvim'
alias v='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gv='neovide --geometry=120x40'

## prompt
fpath+=$HOME/.zsh/pure
autoload promptinit; promptinit
prompt pure

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bash like
bindkey -e

# source work stuff
[[ -e "${HOME}/.workrc" ]] && source "${HOME}/.workrc"


alias luamake=/Users/alex/.bin/lua-language-server/3rd/luamake/luamake

# direnv
eval "$(direnv hook zsh)"
