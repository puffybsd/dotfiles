
# ~/.bashrc
#

#if [ -f /etc/bash_completion ]; then
#	    . /etc/bash_completion
#fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

FG="\[\033[38;5;081m\]"
BG="\[\033[38;5;245m\]"
AT="\[\033[38;5;245m\]"
HCOLOR="\[\033[38;5;206m\]"
PS1="${FG}\u${AT}@${HCOLOR}\H ${BG}\w ${FG}$endchar\[\e[0m\]"

export RUST_SRC_PATH=/opt/code/repos/rust/src
#---start---
# .bashrc

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

alias xscopy='xsel --clipboard --input'
alias xspaste='xsel --clipboard --output'
alias xccopy='xclip -selection clipboard'
alias xcpaste='xclip -selection clipboard -o'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# User specific aliases and functions
#GTK_IM_MODULE=ibus
#IMSETTINGS_MODULE=IBus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#GTK_IM_MODULE_FILE=/usr/lib/gtk-3.0/3.0.0/immodules.cache
alias tmux="tmux -2"
if [ -n "$TMUX" ]; then
  #export TERM=screen-256color
  export TERM=xterm-256color
else
  export TERM=xterm-256color
fi
# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000000
export HISTFILESIZE=${HISTSIZE}
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# prompt
#PS1='[\u@\h \W]\$ '

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
#fi

#export SWIFTENV_ROOT="$HOME/.swiftenv"
#export PATH="$PATH:$SWIFTENV_ROOT/bin"
#eval "$(swiftenv init -)"

export VISUAL=vim
export EDITOR="$VISUAL"

#user path
PATH=~/bin:$PATH

#gems
PATH=~/.gem/ruby/2.4.0/bin:$PATH

export GOPATH=~/

export PATH=$PATH:/opt/android-sdk/platform-tools/

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
