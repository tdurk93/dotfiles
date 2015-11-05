autoload -U compinit promptinit
compinit
promptinit

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CDABLE_VARS
setopt HIST_IGNORE_SPACE

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE

if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi
if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1
export EDITOR=vim
PS1="%F{green}%n%f @ %*: %F{cyan}%~%f%F{red}%%%f "
RPS1="%{%0(?,,)%}%?%{%}"
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
bindkey "^R" history-incremental-pattern-search-backward
# see http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html for ideas
. ~/scripts/bd.zsh
export WORKON_HOME=~/.virtualenvs
source /users/tdurkota3/.local/bin/virtualenvwrapper.sh
