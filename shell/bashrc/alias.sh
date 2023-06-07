#!/bin/bash
# All allias
#

# system alias
alias ls='ls -a --color=auto'
alias l=ls
alias ll=ls
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias jctl='journalctl -p 3 -xb'
alias sb='source ~/.bashrc'
alias pdf='zathura'
alias clip="xclip -selection c"
alias cl='clear'
alias here='pwd | thunar'

# nvim
alias nf='nvim ~/.config/fish/config.fish'
alias nb='nvim ~/.bashrc'
alias niwm='nvim ~/.config/i3/config'
alias nv='nvim'

# git
alias git_sub='git submodule init && git submodule update'
alias cd_git='cd ~/git_projects'

# keyboard
alias setPL='setxkbmap -layout pl'
alias setEN='setxkbmap -layout us'

# cmake
alias cmake_cc='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
alias cmake_cc_ninja='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -GNinja ..'

# docker
alias xhost_init='xhost +local:docker'
alias d_gui='docker run -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" '
alias d_il='docker image list'
alias d_ps='docker ps -a'
alias d_prune='docker container prune'
alias d_rm='docker rmi $(docker images -f "dangling=true" -q)'

