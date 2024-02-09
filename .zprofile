export TERM=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/share/applications/firefox.desktop
export MOZ_ENABLE_WAYLAND=1 firefox
export MANPAGER='nvim +Man!'

if [[ "$(hostname)" == "jonny-archbook" ]]; then
    export warn_about_missing_glyphs=false
    export WLR_NO_HARDWARE_CURSORS=1
    export GTK_THEME=Arc-Dark
    export FZF_DEFAULT_COMMAND='fd -H'

fi

if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi


if [[ ":$PATH:" != *":$HOME/.bun/bin:"* ]]; then
    export PATH="$PATH:$HOME/.bun/bin" && source "/home/jonny/.bun/_bun"
fi

GOBIN_PATH=$(go env GOBIN)
if [[ ":$PATH:" != *":$GOBIN_PATH:"* ]]; then
    export PATH="$PATH:$GOBIN_PATH"
fi

GOPATH_BIN=$(go env GOPATH)/bin
if [[ ":$PATH:" != *":$GOPATH_BIN:"* ]]; then
    export PATH="$PATH:$GOPATH_BIN"
fi
