# Uncomment this to automatically launch tmux when opening a new terminal
# if [ -z "$TMUX" ]; then
#   tmux
# fi

# Aliases
alias la='ls -ah'
alias ll='ls -laFh'

alias ..='cd ..'

alias vim='nvim'
alias vi='nvim'

alias cat='bat'
alias ls='exa'

alias search="fzf --preview 'cat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

alias kssh='kitten ssh'

alias clip="xclip -selection clipboard"

# Ctrl+f to open tmux sessionizer script
bindkey -s ^f "tmux-sessionizer\n"
# Ctrl+a to open tmux session finder script
bindkey -s ^a "tmux-session-finder\n"

# Ctrl+\ to open yazi
bindkey -s ^\\ "yazi\n"

# Ctrl+Backspace
bindkey '^H' backward-kill-word
# Ctrl+Delete
bindkey '^[[3;5~' kill-word
# Ctrl+Arrow right
bindkey "^[[1;5C" forward-word
# Ctrl+Arrow left
bindkey "^[[1;5D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=$HOME/go

PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin:$GOPATH/bin
export PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:/home/marc/.cargo/bin:$PATH"

# fzf keybindings
source /usr/share/doc/fzf/examples/key-bindings.zsh
# fzf fuzzy auto-completion
source /usr/share/doc/fzf/examples/completion.zsh

# bun completions
[ -s "/home/marc/.bun/_bun" ] && source "/home/marc/.bun/_bun"

export EDITOR="nvim"

# zoxide (better cd) init
eval "$(zoxide init zsh)"
# starship prompt init
eval "$(starship init zsh)"

# atuin history init
eval "$(atuin init zsh)"

export PATH="/home/marc/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/marc/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export ZK_NOTEBOOK_DIR="/media/marc/Working-drive/Obsidian_Vaults/Personal"
