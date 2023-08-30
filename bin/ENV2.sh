#!/bin/bash
# ENV2.sh : 환경 설정
# * $HOME/.bashrc

echo "===== [ Phase 2 : 환경파일 설정 ] ====="

# 1) $HOME/.bashrc 파일 설정 절차
BASHRC=$HOME/.bashrc
# BASHRC=/root/bin/bashrc.txt
cat << EOF > $BASHRC
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#
# VSCode alias
#
alias code='code --user-data-dir ~/vscode --no-sandbox'
alias vscode='code'
alias aaa='chmod 700 /root/shell/*.sh'

#
# Shell Script Alias
#
export PATH=$PATH:$HOME/shell

#
# Sfecific configuration
#
export PS1='\[\e[34;1m\][\u@\h\[\e[33;1m\] \w]\\$ \[\e[m\]'

alias h='history'
alias c='clear'
alias clar='clear'
alias tree='tree -CF'

alias bzip2='bzip2 -v'
alias bunzip2='bunzip2 -v'

alias ll='ls -l --color=auto -i'
alias lsf='ls -l | grep "^-"'
alias lsd='ls -l | grep "^d"'
alias ls='ls --color=auto -h -F'
alias pps='ps -ef | head -1 ; ps -ef | grep $1'
alias vi='/usr/bin/vim'
alias grep='grep --color=auto -i'
alias yum='yum -y'
alias df='df -h -T'

alias fwconfig='firewall-config &'
alias fwcmd='firewall-cmd --permanent'
alias fwlist='firewall-cmd --list-all'
alias fwreload='firewall-cmd --reload'

alias google-chrome='/usr/bin/google-chrome --no-sandbox'
alias chrome='google-chrome'

alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones'
alias DNS='cd /var/named'
alias dnslog='tail -f /var/log/messages'

set -o vi
EOF

source $HOME/.bashrc

alias fwcmd >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "[ OK ] $HOME/.bashrc 환경 설정 성공"
else
    echo "[FAIL] $HOME/.bashrc 환경 설정 실패"
    exit 1
fi