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
alias stlu='systemctl --user'

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

    # Setup mcfly
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=5
    export MCFLY_RESULTS=50
    export MCFLY_RESULTS_SORT=LAST_RUN
    eval "$(mcfly init zsh)"
}

export TERM=foot
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/share/applications/firefox-nightly.desktop
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_COMMAND='fd -H'
export FZF_DEFAULT_OPTS="\
    --height 60% \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --layout=reverse \
    --border=none
    --color=bg+:#2d3f76 \
    --color=bg:#1e2030 \
    --color=border:#589ed7 \
    --color=fg:#c8d3f5 \
    --color=gutter:#1e2030 \
    --color=header:#ff966c \
    --color=hl+:#65bcff \
    --color=hl:#65bcff \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#65bcff \
    --color=query:#c8d3f5:regular \
    --color=scrollbar:#589ed7 \
    --color=separator:#ff966c \
    --color=spinner:#ff007c \
    --preview='cat {+}' \
"

alias c='clear'
alias co='wl-copy'
alias l='hyprlock'
alias ls='lsd -Fv --group-directories-first'
alias n='nvim'
alias tm='trash-put'
alias z='zellij'

alias update-pms='go-global-update; cargo install-update --all; bun update -g --all'

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

## Package manager paths
# Luarocks path
eval "$(luarocks path --bin)"
if [[ ":$PATH:" != *":$HOME/.luarocks/bin"* ]]; then
    export PATH="$PATH:$HOME/.luarocks/bin"
fi
# Cargo Path
if [[ ":$PATH:" != *":$HOME/.cargo/bin"* ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
# Bun Path
if [[ ":$PATH:" != *":$HOME/.bun/bin"* ]]; then
    export PATH="$PATH:$HOME/.bun/bin"
fi
export BUN_INSTALL="$HOME/.bun"
# Go Path
GOPATH_BIN=$(go env GOPATH)/bin
if [[ ":$PATH:" != *":$GOPATH_BIN"* ]]; then
    export PATH="$PATH:$GOPATH_BIN"
fi
# Dotnet Path
if [[ ":$PATH:" != *":$HOME/.dotnet/tools"* ]]; then
    export PATH="$PATH:$HOME/.dotnet/tools"
fi
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/jonny/.opam/opam-init/init.zsh' ]] || source '/home/jonny/.opam/opam-init/init.zsh' >/dev/null 2>/dev/null
# END opam configuration

# xc task runner auto-completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/jonny/go/bin/xc xc

# Load starship
eval "$(starship init zsh)"
