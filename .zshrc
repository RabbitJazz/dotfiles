#################
##  EXPORTING  ##
#################
export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export ZSH="/Users/sage/.oh-my-zsh"
export HISTSIZE=5000
export HISTFILESIZE=10000
export UPDATE_ZSH_DAYS=7
#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh
source ~/zsh/.iterm2_shell_integration.zsh
source ~/zsh/Plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh/Plugins/zsh-autosuggestions-master/zsh-autosuggestions.zsh
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source ~/zsh/Plugins/zsh-z/zsh-z.plugin.zsh
source $(dirname $(gem which colorls))/tab_complete.sh
tmux source ~/dotfiles/.tmux.conf

autoload -U compinit && compinit
zstyle ':completion:*' menu select

########################
##  THE THEME CONFIG  ##
########################

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerd-complete"
HIST_STAMPS="dd/mm/yyyy"
CASE_SENSITIVE="false"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

##############################
##  Powerlevel 9k Settings  ##
##############################

#################
##  ELEMENTS   ##
#################

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable root_indicator vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
#oh-my-zsh plugins:
plugins=(git pyenv pip python django brew extract osx gitfast zsh-autosuggestions nvm)

#################
## SEPARATPORS ##
#################

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1
POWERLEVEL9K_DIR_SHORTEN_LENGTH=2
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}╭%F{yellow}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}\u2570%F{yellow}\uF460%F{215}\uF460%F{226}\uF460%f "

#################
##    ICONS    ##
#################

## GIT ICONS : ##

POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d2 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
POWERLEVEL9K_VCS_BRANCH_ICON=$'\ufb2b '
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055 '
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf056 '
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

POWERLEVEL9K_HOME_ICON=$'\uf015 '
POWERLEVEL9K_HOME_SUB_ICON=$'\ufc6e '
POWERLEVEL9K_FOLDER_ICON=$'\ufc6e '
POWERLEVEL9K_ETC_ICON=$'\uf013 '

POWERLEVEL9K_STATUS_ERROR_ICON=$'\uf071 '

typeset POWERLEVEL9K_{USER,REMOTE}_ICON=$'\uf2c0 '
typeset POWERLEVEL9K_{SUDO,REMOTE_SUDO}_ICON=$'\uf007 '
POWERLEVEL9K_USER_ROOT_ICON=$'\uf904 '

###################################
##    BACKGROUND | FOREGROUND    ##
###################################

## GIT BACKGROUND | FOREGROUND ## 
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='cyan'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'

POWERLEVEL9K_VCS_SHOW_CHANGESET='false'

POWERLEVEL9K_DIR_ETC_BACKGROUND='white'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'

POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='black'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='red'


# USER #

POWERLEVEL9K_USER_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='white'

POWERLEVEL9K_USER_ROOT_BACKGROUND='black'
POWERLEVEL9K_USER_ROOT_FOREGROUND='red'

POWERLEVEL9K_USER_SUDO_BACKGROUND='black'
POWERLEVEL9K_USER_SUDO_FOREGROUND='yellow'

POWERLEVEL9K_USER_REMOTE_SUDO_BACKGROUND='cyan'
POWERLEVEL9K_USER_REMOTE_SUDO_FOREGROUND='yellow'

POWERLEVEL9K_USER_REMOTE_BACKGROUND='cyan'
POWERLEVEL9K_USER_REMOTE_FOREGROUND='black'

# STATUS #

POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"

POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

#####################
##    FUNCTIONS    ##
#####################

function mkcd()
{
	mkdir $1 && cd $1
}

function chpwd() {
    emulate -L zsh
    colorls --sd -a
}
###################
##    ALIASES    ##
###################
alias yt="youtube-dl -f 18"
alias clr="clear"
alias dev="cd ~/dev"
alias op="open -a"
alias ope="open -e"
alias subl="sublime "
alias ls='colorls --sd -a'
alias lt='colorls --tree'
alias l='colorls --sd -A'
alias ld='colorls -d'
alias src='source'
alias o='open .' # Open the current directory in Finder
alias v='vim'
#######################
##    GIT ALIASES    ##
#######################

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gs='git status'
alias gitf='cd /Users/sage/dev/Ready_4Git'

#######################
##    TMUX ALIASES   ##
#######################

alias tnews='tnew_session'
alias tls='tmux list-session'
alias tlw='tmux list-window'
alias tsw='tmux switch --t '
alias tlc='tmux list-command'
alias tat='tmux attach --t'
alias trs='tmux rename-session --t'
alias tks='tmux kill-session --t'
alias tkss='tmux kill-server --t'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
