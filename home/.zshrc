# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/marc/.zsh/completions:"* ]]; then export FPATH="/home/marc/.zsh/completions:$FPATH"; fi
# Uncomment this to automatically launch tmux when opening a new terminal
# if [ -z "$TMUX" ]; then
#   tmux
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# I don't use this, because i use the starship prompt

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm bun docker golang rust ssh tmux z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Print a random animal with a random quote when opening a new terminal
# cows=(apt bud-frogs bunny cheese cock cower default dragon-and-cow dragon duck elephant elephant-in-snake eyes flaming-sheep koala luke-koala milk moofasa moose pony-smaller sheep skeleton snowman stegosaurus three-eyes turtle tux unipony-smaller vader vader-koala www)
# cow=${cows[$RANDOM % ${#cows[@]} ]}
# fortune | cowsay -f $cow
# echo "--------------------------------------------------------------------"

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

. "$HOME/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# starship prompt init
eval "$(starship init zsh)"

export PATH="/home/marc/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/marc/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
