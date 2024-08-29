# History
HISTFILE=~/.histfile
HISTSIZE=500000
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

# Podman/Docker Alias
alias pm='podman'
alias dc='sudo docker'

# SSH Agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/id_rsa

# Up and Down scroll history based on first letters typed
function zvm_after_init() {
    bindkey "^[[B" history-beginning-search-forward
    bindkey "^[[A" history-beginning-search-backward
}

alias c='clear'
alias co='wl-copy'
alias l='hyprlock'
alias lr='luarocks'
alias lrn='LUAROCKS_CONFIG=$HOME/.luarocks/config-nlua.lua luarocks --local'
alias ls='lsd -Fv --group-directories-first'
alias n='nvim'
alias ss='grim -g "$(slurp -o -r )" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png'
alias tm='trash-put'
alias z='zellij'

alias update-pms='go-global-update; cargo install-update --all; bun update -g --all'

alias Scarab='/home/jonny/Apps/Scarab/Scarab'

# shellcheck source='/usr/share/fzf/completion.zsh'
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

eval "$(sheldon source)"

# Set luarocks path
eval "$(luarocks path --bin)"

# Load starship
eval "$(starship init zsh)"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/jonny/go/bin/xc xc
