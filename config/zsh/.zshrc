export ZSH="$HOME/.oh-my-zsh"  # If you're using Oh My Zsh

export PATH="$PATH:$(npm config get prefix)/bin"

# Theme
source "$HOME/code/pig_configs/config/zsh/themes/spaceship-prompt/spaceship.zsh-theme"

alias vim="nvim"

# History is important
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Aliases
alias ls="ls -G"
alias ll="ls -la"
alias gs="git status"
alias gco="git checkout"
alias gp="git pull"

# Navigation
alias slopeb="cd ~/code/slope/crm-backend/"
alias slopef="cd ~/code/slope/crm-frontend/"
alias slopex="cd ~/code/slope/crm-extension/"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

 # Load super secret configurations (aliases, credentials, etc.)
if [ -f ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi
source '/opt/homebrew/opt/autoenv/activate.sh'

alias python="python3"

rename_band_photos() {
  local band_slug=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  ls -v | cat -n | while read n f; do
    mv "$f" "${band_slug}-${n}-2026-actlis-lens.jpg"
  done
}

ytdl() {yt-dlp -x -t mp3 "$1"}
