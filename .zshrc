# History
SAVEHIST=500000
setopt INC_APPEND_HISTORY
HISTFILE=~/.histfile
HISTSIZE=500000
# Auto Complete
zstyle :compinstall filename '/home/jonny/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz compinit && compinit
_comp_options+=(globdots)
autoload -Uz bashcompinit && bashcompinit

# Keybindings
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word

# Git Aliases
alias g='git'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cf='config'

# SystemCTL Alias
alias sss='sudo systemctl status'
alias ssr='sudo systemctl restart'
alias sst='sudo systemctl start'
alias ssp='sudo systemctl stop'
alias sse='sudo systemctl enable'
alias ssd='sudo systemctl disable'

#SSH Agent
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519

function zvm_after_init() {
	bindkey "^[[B" history-beginning-search-forward
	bindkey "^[[A" history-beginning-search-backward
}

fpath=(~/.zsh $fpath)

# Machine Specific Config
if [[ "$(hostname)" == "jonny-archbook" ]]; then
	# jonny-archbook
	source /home/jonny/.zshrc_secrets

	alias z='zellij'
	alias c='clear'
	alias co='wl-copy'
	alias ss='grim -g "$(slurp -o -r )" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png'
	alias tm='trash-put'
	alias lock='/usr/bin/waylock -init-color 0x002020 -input-color 0x004040 -fail-color 0x200000'
	alias pullKeepass='rclone sync proton:Keepass/Passwords.kdbx ~/Documents/Keepass/'
	alias pushKeepass='rclone sync ~/Documents/Keepass/Passwords.kdbx proton:Keepass/'

	alias sshDev='ssh jonny@192.168.0.50'
	alias sshCRM='ssh jonny@192.168.0.152'
	alias rdpJLoughlin='wlfreerdp /v:192.168.0.65:3389 /u:jloughlin /p:$CARSON_DOMAIN_PASS /d:carsonoptical /sec:tls /dynamic-resolution'
	alias rdpCallisto='wlfreerdp /v:192.168.0.224:3389 /u:jloughlin /p:$CARSON_DOMAIN_PASS /d:carsonoptical /sec:tls /dynamic-resolution'

	alias Vial='/home/jonny/Apps/Vial/AppRun'
	eval "$(sheldon source)"
fi

eval "$(starship init zsh)"
