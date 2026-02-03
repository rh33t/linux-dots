# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'
DISABLE_MAGIC_FUNCTIONS=true

# ZSH plugins
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  laravel
)

ZSH_THEME="powerlevel10k/powerlevel10k"

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

z() {
  local dir=$(
    zoxide query --list --score |
      fzf --height 60% --layout reverse --info inline \
      --nth 2.. --no-sort --query "$*" \
      --bind 'enter:become:echo {2..}'
    ) && cd "$dir"
  }

# tools configuration
if [ -f ~/.tools.zsh ]; then
  source ~/.tools.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
