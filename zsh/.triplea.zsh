# env variables
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --cycle'
export MANPAGER='nvim +Man!'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/applications/scripts

# aliases
alias y='yazi'
alias v='nvim'
alias vim='nvim'
alias p='python3'
alias k='kubectl'
alias opx='xdg-open'
alias sdm='sudo dmesg'
alias pysrv='python3 -m http.server'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias pfn='ping ping-eu.ds.on.epicgames.com'
alias ls='eza -al --group-directories-first --icons --git'
alias dccdi='docker rmi $(docker images -f "dangling=true" -q)'
alias dccall='docker stop $(docker ps -aq) > /dev/null && docker rm $(docker ps -aq) > /dev/null'
alias phpd='php -S localhost:7000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1'
alias efs='file=$(fzf --reverse --preview="bat --theme Visual\ Studio\ Dark+ --color=always --style=numbers --line-range=:500 {}" --walker-skip=.git,vendor,node_modules -i) && [ -n "$file" ] && nvim "$file"'
alias pve="export TERM=xterm && ssh -i ~/labs/sysadmin/ssh_keys/proxmox root@192.168.10.2 -t 'tmux attach-session -t sysadmin || tmux new-session -s sysadmin'"
alias cdl='cd ~/labs; clear;'
alias cdo='cd ~/.dotfiles; clear;'
alias cdc='cd ~/labs/coding; clear;'
alias cdd='cd ~/labs/hacking; clear;'
alias cdw='cd ~/labs/workspace; clear;'
alias cds='cd ~/labs/sysadmin; clear;'
alias cdt='cd ~/personal/todo; clear;'
alias cdp='cd ~/personal; clear;'
alias rlwrap='rlwrap --history-filename=$HOME/.rlwrap_history'
alias falias='alias | fzf'
alias bytdlp='yt-dlp -f "bestvideo*+bestaudio/best" --merge-output-format mp4'
alias sourcepy='[ -f $PWD/.venv/bin/activate ] && source $PWD/.venv/bin/activate || echo "No .venv found in this directory."'
alias aur-search='yay -Slq | fzf --multi --preview "yay -Si {1}" --preview-window=right:60%:wrap | xargs -ro yay -S'
alias pac-search='pacman -Slq | fzf --multi --preview "pacman -Si {1}" --preview-window=right:60%:wrap | xargs -ro sudo pacman -S'

# custom functions
quickcommit() {
  msg=${1:-"quick save in $(basename "$PWD") - $(date +%F_%H:%M:%S)"}
  git add -A && git commit -m "$msg" && git push
}

# create a new directory and drop in
mcd() {
  mkdir -p "$1" && cd "$1"
}

# copy file content to clipboard
fcopy() {
  if [ -f "$1" ]; then
    cat $1 | pbcopy
  fi
}

# useful when creating some date base dir like `mkdir crackme-$(today)`
today() {
  echo $(date +"%d-%m-%Y")
}

# cheat.sh
cheater() {
  curl -s "cheat.sh/$(printf '%s' "$*" | tr ' ' '+')"
}

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^k "efs\n"
