# History
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000
setopt INC_APPEND_HISTORY

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

alias z='zellij'
alias n='nvim'
alias c='clear'
alias l='hyprlock'
alias co='wl-copy'
alias ss='grim -g "$(slurp -o -r )" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png'
alias tm='trash-put'
alias ls='lsd -Fv --group-directories-first'

alias Scarab='/home/jonny/Apps/Scarab/Scarab'

source <(fzf --zsh)

f() {
    selected_path=$(command fzf)
    if [[ -d "$selected_path" ]]; then
        cd "$selected_path" || exit
    elif [[ -f "$selected_path" ]]; then
        cd "$(dirname "$selected_path")" || exit
    fi
}

fz() {
    selected_path=$(command fzf)
    if [[ -d "$selected_path" ]]; then
        cd "$selected_path" && nvim
    elif [[ -f "$selected_path" ]]; then
        cd "$(dirname "$selected_path")" && nvim
    fi
}

fzf() {
    command fzf | wl-copy
}

alias sshCRMExtended='ssh jonny@192.168.0.152'
alias sshCRMStaging='ssh apps@192.168.0.249'

eval "$(sheldon source)"

# Load starship
eval "$(starship init zsh)"

# bun completions
[ -s "/home/jonny/.bun/_bun" ] && source "/home/jonny/.bun/_bun"
