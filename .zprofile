export TERM=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/share/applications/firefox.desktop
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_COMMAND='fd -H'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border' fzf

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
