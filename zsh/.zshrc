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

# bgnotify config
bgnotify_bell=false
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  # Humanly readable elapsed time
  local elapsed="$(( $3 % 60 ))s"
  (( $3 < 60 ))   || elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
  (( $3 < 3600 )) || elapsed="$((  $3 / 3600 ))h $elapsed"
  [ $1 -eq 0 ] && title="done" || title="dead"
  bgnotify "$title - took ${elapsed}" "$2"
}

# ZSH plugins
plugins=(
  zsh-autosuggestions
  bgnotify
  zsh-syntax-highlighting
  git
)

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# Custom configuration
[[ ! -f ~/.triplea.zsh ]] || source ~/.triplea.zsh

# Fuzzy search history
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Zoxide
eval "$(zoxide init zsh)"

z() {
  local dir=$(
    zoxide query --list --score |
      fzf --height 70% --layout reverse --info inline \
      --nth 2.. --no-sort --query "$*" \
      --bind 'enter:become:echo {2..}'
    ) && cd "$dir"
  }

# tools configuration
[[ ! -f ~/.tools.zsh ]] || source ~/.tools.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
