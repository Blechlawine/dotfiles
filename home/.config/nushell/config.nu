$env.config.buffer_editor = "nvim"

alias ll = ls -la
alias .. = cd ..

alias vi = nvim
alias vim = nvim

alias clip = xclip -selection clipboard

# load generated zoxide config
source ~/.zoxide.nu

# configure starship prompt for nushell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
