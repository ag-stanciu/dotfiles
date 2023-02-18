# stuff
zstyle :compinstall filename '/Users/alex/.zshrc'

# brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
compinit

# history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# alias
alias grep='grep --color=auto'
alias vim='nvim'
alias v='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gv='~/dev/neovide/target/release/neovide'

## prompt
fpath+=$HOME/.zsh/pure
autoload promptinit; promptinit
prompt pure

# bash like
bindkey -e

# source work stuff
[[ -e "${HOME}/.workrc" ]] && source "${HOME}/.workrc"

# direnv
eval "$(direnv hook zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Created by `pipx` on 2021-11-18 08:26:39
export PATH="$PATH:/Users/alex/.local/bin:/opt/homebrew/bin"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
