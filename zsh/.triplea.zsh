# Author: 3a1337

# Variables | Start
export PATH=$PATH:$HOME/Android/Sdk/emulator
export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/applications/cli
export PATH=$PATH:$HOME/applications/sdks/flutter/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:/home/kraaakilo/.local/share/JetBrains/Toolbox/scripts"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export MANPAGER='nvim +Man!'
export VAGRANT_HOME=~/data/vagrant
# Variables | End

# Aliases | Start
alias v='nvim'
alias opx='xdg-open'
alias p='python3'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias efs='file=$(fzf --reverse --preview="cat {}" --walker-skip=.git,vendor,node_modules -i) && [ -n "$file" ] && nvim "$file"'
alias cdo='cd ~/.dotfiles; clear; tput setaf 2; echo -e "\033[1;32mHello Mr TripleA;\033[0m \033[1;34mWelcome to your \033[1;37mDotfiles\033[1;34m!\033[0m"; tput sgr0'
alias cdc='cd ~/Labs/coding; clear; tput setaf 2; echo -e "\033[1;32mHello Mr TripleA;\033[0m \033[1;34mWelcome to the \033[1;37mCoding Lab\033[1;34m!\033[0m"; tput sgr0'
alias cdd='cd ~/Labs/hacking; clear; tput setaf 4; echo -e "\033[1;36mHello Mr TripleA;\033[0m \033[1;33mWelcome to the \033[1;31mCybersec Lab\033[1;33m!\033[0m"; tput sgr0'
alias cdl='cd ~/Labs/; clear; tput setaf 4; echo -e "\033[1;34mHello Mr TripleA;\033[0m \033[1;37mWelcome to the Lab!\033[0m"; tput sgr0'
alias cds='cd ~/Labs/sysadmin/; clear; tput setaf 6; echo -e "\033[1;36mHello Mr TripleA;\033[0m \033[1;35mWelcome to the SysAdmin Lab!\033[0m"; tput sgr0'
alias cdwin='cd ~/Labs/windows; clear; tput setaf 3; echo -e "\033[1;33mHello Mr TripleA;\033[0m \033[1;36mWelcome to the Windows Lab!\033[0m"; tput sgr0'
alias cdw='cd ~/Labs/workspace/; clear; tput setaf 3; echo -e "\033[1;33mHello Mr TripleA;\033[0m \033[1;36mWelcome to your Workspace directory!\033[0m"; tput sgr0'
alias phpd='php -S localhost:7000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1'
alias dccall='docker stop $(docker ps -aq) > /dev/null && docker rm $(docker ps -aq) > /dev/null'
alias dccdi='docker rmi $(docker images -f "dangling=true" -q)'
alias pfn='ping ping-eu.ds.on.epicgames.com'
alias pve="export TERM=xterm && ssh -i ~/Labs/sysadmin/ssh_keys/proxmox root@192.168.1.200 -t 'tmux attach-session -t sysadmin || tmux new-session -s sysadmin'"
alias ls='eza -al --group-directories-first --icons --git'
alias pysrv='python3 -m http.server'
alias y='yazi'
alias clean-pkgs='sudo pacman -Sc ; orphans=$(pacman -Qtdq) ; [ -n "$orphans" ] && sudo pacman -Rs $orphans || echo "No orphans to remove" ; yay -Scc'

# Custom functions
quickcommit() {
  msg=${1:-"quick save in $(basename "$PWD") - $(date +%F_%H:%M:%S)"}
  git add -A && git commit -m "$msg" && git push
}

# Create a new directory and enter it
mcd() {
  mkdir -p "$1" && cd "$1"
}

# Copy file content to clipboard
fcopy() {
  if [ -f "$1" ]; then
    cat $1 | pbcopy
  fi
}

# PNPM | Start
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# PNPM | End

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^k "efs\n"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
