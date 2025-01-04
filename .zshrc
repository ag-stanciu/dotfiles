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
alias gv='~/dev/neovide/target/release/neovide'

# bash like
bindkey -e

eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd --shell zsh)"

# source work stuff
[[ -e "${HOME}/.workrc" ]] && source "${HOME}/.workrc"

# direnv
eval "$(direnv hook zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Created by `pipx` on 2021-11-18 08:26:39
export PATH="$PATH:/Users/alex/.local/bin:/opt/homebrew/bin"

autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add Docker Desktop for Mac (docker)
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
