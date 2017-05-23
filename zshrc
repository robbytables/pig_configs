# Path to your oh-my-zsh installation.
#export ZSH=$HOME/.oh-my-zsh


# WAYFAIR SHIT
alias recenv='source /wayfair/data/codebase/recsvc/venv/bin/activate'
alias gogo='/wayfair/data/codebase/recsvc/bin/run_local.sh'

# GITS
alias gpom='git pull origin master'
alias gf='git fetch'
alias gup='git commit --amend -C HEAD'
alias gco='git checkout '


# zsh config
autoload -Uz colors compinit vcs_info
colors; compinit; vcs_info

setopt complete_in_word
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt interactivecomments
setopt prompt_subst
setopt share_history

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true
# disable-patterns bug:
# http://www.zsh.org/mla/workers/2014/msg01186.html
VCS_INFO_DISABLE_PATTERNS=(
  '/wayfair/mnt/codebase(|/*)'
  "${HOME}/(email-templates|php|resources|templates)(|/*)"
)
zstyle ':vcs_info:*' disable-patterns "${VCS_INFO_DISABLE_PATTERNS[@]}"
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:*' unstagedstr 'U'
zstyle ':vcs_info:*' actionformats \
  " [%{$fg_bold[blue]%}%s%{%f%%b%} %{$fg_bold[cyan]%}%b%{%f%%b%} %{$fg_bold[magenta]%}%a%{%f%%b%} %{$fg_bold[green]%}%c%{%f%%b%}%{$fg_bold[yellow]%}%u%{%f%%b%}]"
zstyle ':vcs_info:*' formats \
  " [%{$fg_bold[blue]%}%s%{%f%%b%} %{$fg_bold[cyan]%}%b%{%f%%b%} %{$fg_bold[green]%}%c%{%f%%b%}%{$fg_bold[yellow]%}%u%{%f%%b%}]"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ "$(git rev-parse --is-inside-work-tree 2> '/dev/null')" == 'true' ]] && \
    git status --porcelain | grep '^??' &> '/dev/null' ; then
    hook_com[unstaged]+="%{$fg_bold[red]%}?%{%f%}"
  fi
}

HISTFILE="${HOME}/.zhistory"
HISTSIZE=1000
SAVEHIST=2000

PS1='[%n@%m] '
PS1+='%~'
PS1+='${vcs_info_msg_0_} '
PS1+='%# '

# precmd auto executed before every prompt
precmd() {
  vcs_info
}

make_diff() {
  git diff --full-index -M HEAD~1 > /wayfair/data/codebase/diffs/$1.diff
}
alias vsql='/opt/vertica/bin/vsql -C'
alias rabbit='cd ~/u_drive/python/py_sandbox/python/data_science/tv_rabbit'
alias gdiff=make_diff
alias cdphp='cd /wayfair/data/codebase/WEBPHP173/php'


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bira"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#source $ZSH/oh-my-zsh.sh

# User configuration
alias runtests="phpunit --configuration /usr/local/www/data/tests/conf --strict --testsuite all_suite"
export PATH="/wayfair/mnt/codebase/DEVWEBPHP173/scripts:/usr/local/bin:/bin:/usr/bin:/csnzoo/rgrodin/bin:/usr/local/sbin:/usr/sbin:/sbin:/csnzoo/rgrodin/bin:/wayfair/bin/:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# WAYFAIR SPECIFIC
if [ -h /usr/java/default ]; then
  export JAVA_HOME=/usr/java/default
  export PATH=$JAVA_HOME/bin:$PATH
fi

if [ -d /wayfair/pkg/python2.7 ]; then
  export PATH=/wayfair/pkg/python2.7/latest/bin:$PATH
fi

zkbd_bind_key() {
    local KEY="${1}"
    local ACTION="${2}"

    if test -n "${key[${KEY}]}" ; then
        bindkey "${key[${KEY}]}" "${ACTION}"
    fi
}

ZKBD_CONF="${HOME}/.zkbd/${TERM}-${${DISPLAY:t}:-${VENDOR}-${OSTYPE}}"
if test -f "${ZKBD_CONF}" ; then
    source "${ZKBD_CONF}"
    zkbd_bind_key 'Backspace' 'backward-delete-char'
    zkbd_bind_key 'Insert'    'overwrite-mode'
    zkbd_bind_key 'Home'      'beginning-of-line'
    zkbd_bind_key 'PageUp'    'history-beginning-search-backward'
    zkbd_bind_key 'Delete'    'delete-char'
    zkbd_bind_key 'End'       'end-of-line'
    zkbd_bind_key 'PageDown'  'history-beginning-search-forward'
    zkbd_bind_key 'Up'        'up-line-or-search'
    zkbd_bind_key 'Down'      'down-line-or-search'
fi

###########
# Vertica #
###########

export VSQL_DATABASE='wayfair'
export VSQL_HOST='boverticac1n01'
export VSQL_USER='dash_init'
export VSQL_PASSWORD='Vyxzo!wdqO3?s+'
