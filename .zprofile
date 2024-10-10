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
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=5
export MCFLY_RESULTS=50
export MCFLY_RESULTS_SORT=LAST_RUN

# Setup mcfly
eval "$(mcfly init zsh)"

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
# Luarocks Path
if [[ ":$PATH:" != *":$HOME/.luarocks/bin"* ]]; then
    export PATH="$PATH:$HOME/.luarocks/bin"
fi

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/jonny/.opam/opam-init/init.zsh' ]] || source '/home/jonny/.opam/opam-init/init.zsh' >/dev/null 2>/dev/null
# END opam configuration
