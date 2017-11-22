# Path to your oh-my-zsh installation.
export ZSH=/Users/ploskina/.oh-my-zsh

export HOMEBREW_GITHUB_API_TOKEN=a5fa488066543113c06a152b00c85b4915379f15

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="theunraveler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh-custom

#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1"   ] && [ -s $BASE16_SHELL/profile_helper.sh   ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-syntax-highlighting symfony2)
plugins=(git symfony2)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# # Ensure user-installed binaries take precedence
#export PATH=/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

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
#alias tmux="TERM=screen-256color-bce tmux -2"
#alias tmux="tmux -2"
alias ssh="TERM=xterm ssh"
alias dc="docker-compose"

export CLICOLOR=1
export TERM=xterm-256color

# Base16 Shell
#BASE16_SHELL="$HOME/.vim/bundle/vim-hybrid-material/base16-material/base16-material.dark.sh"
#[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# virtualenvwrapper values
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export WORKON_HOME=/apps/env27/virtualenv
export PROJECT_HOME=/apps/env27/project
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME

source /usr/local/bin/virtualenvwrapper.sh

#syspip to run commands against base python
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

#### My aliases
alias cdgcax="cd ~/svn_export/webdev/gca/branches/v2.1"
alias cdgcal="cd ~/svn_local/webdev/gca/branches/v2.1"

# begin Oracle config
export ORACLE_HOME=/usr/local/lib/oracle/instantclient_12_1
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH
SQL_PATH=/usr/local/lib/oracle/instantclient_12_1:${SQL_PATH}
export SQL_PATH
export FORCE_RPATH=1
# end Oracle config


export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$ORACLE_HOME"
#export PATH="/Users/ploskina/bin/Sencha/Cmd/6.1.2.15:$PATH"
export PATH="/Users/ploskina/bin:$PATH"
export PATH="/Users/ploskina/golang/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# GOLANG
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#export PATH="/usr/local/bin/Sencha/Cmd:$PATH"
export PATH="/Users/ploskina/bin/Sencha/Cmd:$PATH"
export PATH="${PATH}:$(yarn global bin)"

export SVN_EDITOR="/usr/local/bin/vi"

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/ploskina/.yarn-config/global/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/ploskina/.yarn-config/global/node_modules/tabtab/.completions/electron-forge.zsh

alias sv="sudo -u ploskina vim"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
