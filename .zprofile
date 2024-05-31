export TERM=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/share/applications/firefox.desktop
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_COMMAND='fd -H'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
	export PATH="$PATH:$HOME/.cargo/bin"
fi

if [[ ":$PATH:" != *":$HOME/.bun/bin:"* ]]; then
	export PATH="$PATH:$HOME/.bun/bin"
fi
export BUN_INSTALL="$HOME/.bun"

GOBIN_PATH=$(go env GOBIN)
if [[ ":$PATH:" != *":$GOBIN_PATH:"* ]]; then
	export PATH="$PATH:$GOBIN_PATH"
fi

GOPATH_BIN=$(go env GOPATH)/bin
if [[ ":$PATH:" != *":$GOPATH_BIN:"* ]]; then
	export PATH="$PATH:$GOPATH_BIN"
fi
