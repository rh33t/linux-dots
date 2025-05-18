export ZSH="$HOME/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

# ZSH plugins
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  laravel
)

source $ZSH/oh-my-zsh.sh

# Custom configuration
if [ -f ~/.triplea.zsh ]; then
  source ~/.triplea.zsh
fi

# Fuzzy search history
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"


z() {
  local dir=$(
    zoxide query --list --score |
      fzf --height 60% --layout reverse --info inline \
      --nth 2.. --no-sort --query "$*" \
      --bind 'enter:become:echo {2..}'
    ) && cd "$dir"
  }

