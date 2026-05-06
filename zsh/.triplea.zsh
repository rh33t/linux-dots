# env variables
export FZF_DEFAULT_OPTS='--layout reverse --cycle'
export MANPAGER='nvim +Man!'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.4.0/bin
export PATH=$PATH:$HOME/.local/share/scripts
export PATH=$PATH:$HOME/applications/scripts

# aliases
alias y='yazi'
alias v='nvim'
alias C='code .'
alias vim='nvim'
alias p='python3'
alias k='kubectl'
alias opx='xdg-open'
alias sdm='sudo dmesg'
alias pysrv='python3 -m http.server'
alias dir='dir --color=auto'
alias l='eza -l --color=always --group-directories-first --icons --git'
alias la='eza -a --color=always --group-directories-first --icons'
alias ls='eza -al --color=always --group-directories-first --icons --git'
alias lt='eza -aT --color=always --group-directories-first --icons auto'
alias wget='wget -c'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias pfn='ping ping-eu.ds.on.epicgames.com'
alias dccdi='docker rmi $(docker images -f "dangling=true" -q)'
alias dcit='docker run --rm -it -v /tmp:/tmp -v "$PWD":/pwn -w /pwn'
alias dccall='docker stop $(docker ps -aq) > /dev/null && docker rm $(docker ps -aq) > /dev/null'
alias phpd='php -S localhost:7000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1'
alias efs='file=$(fzf --reverse --preview="bat --color=always --style=numbers --line-range=:500 {}" --walker-skip=.git,vendor,node_modules -i) && [ -n "$file" ] && nvim "$file"'
alias pve="export TERM=xterm-256color && ssh -i ~/labs/sysadmin/ssh_keys/pve_host root@192.168.10.2 -t 'tmux attach-session -t sysadmin || tmux new-session -s sysadmin'"
alias dl='cd ~/Downloads'
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
alias today='date +"%Y-%m-%d"'
alias bytdlp='yt-dlp -f "bestvideo*+bestaudio/best" --merge-output-format mp4'
alias sourcepy='[ -f $PWD/.venv/bin/activate ] && source $PWD/.venv/bin/activate || echo "No .venv found in this directory."'
alias aur-search='yay -Slq | fzf --multi --preview "yay -Si {1}" --preview-window=right:60%:wrap | xargs -ro yay -S'
alias pac-search='pacman -Slq | fzf --multi --preview "pacman -Si {1}" --preview-window=right:60%:wrap | xargs -ro sudo pacman -S'

# custom functions
lxc() { [[ -z "$1" ]] && echo "usage: lxc <id> [port]" && return 1; ssh -i ~/labs/sysadmin/ssh_keys/pve_guest -p "${2:-22}" root@192.168.10."$1"; }
mcd() { mkdir -p "$1" && cd "$1"; }
fcopy() { [[ -f "$1" ]] && cat "$1" | xclip -selection clipboard; }
cheater() { curl -s "cheat.sh/$(printf '%s' "$*" | tr ' ' '+')"; }
quickcommit() { local b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); git add -A && git commit -m "${1:-"chore($(basename $PWD)): sync on $b at $(date +%Y-%m-%dT%H:%M:%S)"}" && git push origin "$b"; }
termbin(){ [ -t 0 ] && [ -f "$1" ] && cat "$1" | nc termbin.com 9999 || nc termbin.com 9999; }

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^k "efs\n"
