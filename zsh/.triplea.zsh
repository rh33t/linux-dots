# Description: This file contains my custom aliases and functions
# Author: TripleA

# PATH Variables | Start
export PATH=$PATH:$HOME/Android/Sdk/emulator
export PATH=$PATH:$HOME/Android/Sdk/platform-tools
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/apps/cli
export PATH=$PATH:$HOME/apps/sdks/flutter/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin/
export PATH="$PATH:/home/kraaakilo/.local/share/JetBrains/Toolbox/scripts"
# PATH Variables | End

# Aliases | Start
alias v='nvim'
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
alias sfs='fzf --reverse --preview="cat {}" --walker-skip=.git,vendor,node_modules -i'
alias efs='file=$(sfs) && [ -n "$file" ] && nvim "$file"'
alias off='shutdown -h now'
alias reb='systemctl reboot'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias cdo='cd ~/.dotfiles; clear; tput setaf 2; echo -e "\033[1;32mHello Mr TripleA;\033[0m \033[1;34mWelcome to your \033[1;37mDotfiles\033[1;34m!\033[0m"; tput sgr0'
alias cdc='cd ~/Labs/coding; clear; tput setaf 2; echo -e "\033[1;32mHello Mr TripleA;\033[0m \033[1;34mWelcome to the \033[1;37mCoding Lab\033[1;34m!\033[0m"; tput sgr0'
alias cdd='cd ~/Labs/hacking; clear; tput setaf 4; echo -e "\033[1;36mHello Mr TripleA;\033[0m \033[1;33mWelcome to the \033[1;31mCybersec Lab\033[1;33m!\033[0m"; tput sgr0'
alias sth='cd ~/Labs/hacking; clear; echo -e "\033[1;31mBooting \033[1;32mTripleA \033[1;31mHacking \033[1;32mLab...\033[0m"; vagrant up > /dev/null && vagrant ssh'
alias cdl='cd ~/Labs/; clear; tput setaf 4; echo -e "\033[1;34mHello Mr TripleA;\033[0m \033[1;37mWelcome to the Lab!\033[0m"; tput sgr0'
alias cdv='cd ~/Labs/devops; clear; tput setaf 6; echo -e "\033[1;36mHello Mr TripleA;\033[0m \033[1;35mWelcome to the DevOps Lab!\033[0m"; tput sgr0'
alias cdw='cd ~/Labs/windows; clear; tput setaf 3; echo -e "\033[1;33mHello Mr TripleA;\033[0m \033[1;36mWelcome to the Windows Lab!\033[0m"; tput sgr0'
alias cdm='cd ~/Labs/machine-learning/; clear; tput setaf 3; echo -e "\033[1;33mHello Mr TripleA;\033[0m \033[1;36mWelcome to the Machine Learning Lab!\033[0m"; tput sgr0'
alias cdt='cd ~/trashable; clear; tput setaf 3; echo -e "\033[1;33mHello Mr TripleA;\033[0m \033[1;36mWelcome to your Trashable directory!\033[0m"; tput sgr0'
alias phpd='php -S localhost:7000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1'
alias dccall='docker stop $(docker ps -aq) > /dev/null && docker rm $(docker ps -aq) > /dev/null'
alias dccdi='docker rmi $(docker images -f "dangling=true" -q)'
alias pma='docker rm phpmyadmin --force && docker run --name phpmyadmin -d -e PMA_HOST=192.168.1.30 -p 9876:80 phpmyadmin'
alias pfn='ping ping-eu.ds.on.epicgames.com'
alias pve="ssh -i ~/Labs/devops/pve root@192.168.1.10 -t 'tmux attach || tmux new'"
alias ls='eza -al --group-directories-first --icons --git'
alias pysrv='python3 -m http.server'
# Aliases | End

# Custom functions | Start
fcommit()
{
    git add .
    git commit -m "$@"
}
update_repo()
{
    git add .
    git commit -m "$@"
    git push
}
# Custom functions | End

# PNPM | Start
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# PNPM | End

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^k "efs\n"
