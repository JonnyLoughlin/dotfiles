# History
HISTFILE=~/.histfile
HISTSIZE=1000000
TERM=xterm-256color
# shellcheck disable=SC2034
SAVEHIST=500000
setopt INC_APPEND_HISTORY
# I hate this
setopt IGNOREEOF

# Auto Complete
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
_comp_options+=(globdots)

# Git Aliases
alias g='git'
alias cf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# SystemCTL Alias
alias stl='sudo systemctl'
alias stlu='systemctl --user'

# Podman/Docker Alias
alias pm='podman'
alias dc='sudo docker'

# Up and Down scroll history based on first letters typed
function zvm_after_init() {
    bindkey "^[[B" history-beginning-search-forward
    bindkey "^[[A" history-beginning-search-backward
}

alias c='clear'
alias co='wl-copy'
alias ff="firefox-nightly"
alias l='hyprlock'
alias ls='lsd -Fv --group-directories-first'
alias n='nvim'
alias tm='trash-put'
alias z='zellij'

alias nnvim="cd ~/.config/nvim && nvim"

alias update-pms='go-global-update; cargo install-update --all; bun update -g --all'

# shellcheck disable=SC1090
source <(fzf --zsh)
f() {
    selected_path=$(command fzf)
    if [[ -d "$selected_path" ]]; then
        cd "$selected_path" || exit
    elif [[ -f "$selected_path" ]]; then
        cd "$(dirname "$selected_path")" || exit
    fi
}
alias fzc='fzf | wl-copy'

alias sshCRMExtended='ssh apps@192.168.0.152'
alias sshCRMStaging='ssh apps@192.168.0.45'
alias sshCarson-Retailer-Dashboard='ssh apps@192.168.0.118'

# xc task runner auto-completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/jonny/go/bin/xc xc

# NVM
# source /usr/share/nvm/init-nvm.sh

# Load sheldon plugins
eval "$(sheldon source)"

# Load starship
eval "$(starship init zsh)"

#Load Mise
eval "$(mise activate zsh)"
