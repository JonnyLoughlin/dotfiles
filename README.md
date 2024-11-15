## Setup 

To checkout the repo on a new machine, run:

```sh
alias cf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
cf checkout
chmod +x "$HOME"/.config/scripts/git-hooks/setup-git-hooks.sh
./"$HOME"/.config/scripts/git-hooks/setup-git-hooks.sh
```

This will pull the repo down, checkout the config, then run a script to commit an updated package list on every commit.
