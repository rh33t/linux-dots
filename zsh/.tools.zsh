# Android
export ANDROID_HOME="$HOME/sdks/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"

# Dart & Flutter
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/sdks/flutter/bin"

# Go
export PATH="$PATH:$HOME/go/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Vagrant
export VAGRANT_HOME="$HOME/data/vagrant"
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.9/contrib/zsh $fpath)
compinit

# Chrome
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# nvm
# source /usr/share/nvm/init-nvm.sh

# helm completion
# alias soh='source <(helm completion zsh)'
