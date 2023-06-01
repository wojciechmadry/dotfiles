#
# Fish shell configuration
#

# --- Aliases ---
alias ls='ls --color=auto'
alias l=ls
alias jctl='journalctl -p 3 -xb'
alias update='sudo pacman -Syyu'
alias upgrade='sudo pacman -Syyu'
alias nf='nvim ~/.config/fish/config.fish'
alias nstatus='sudo nvim /etc/i3status.conf'
alias gf='gedit ~/.config/fish/config.fish'
alias nb='nvim ~/.bashrc'
alias gb='gedit ~/.bashrc'
alias sb='source ~/.bashrc && source ~/.config/fish/config.fish'
alias sf='sb'
alias git_sub='git submodule init && git submodule update'
alias niwm='nvim ~/.config/i3/config'
alias giwm='gedit ~/.config/i3/config'
alias ls='ls -a --color=auto'
alias nv='nvim'
alias cd_git='cd ~/git_projects'
alias snapshot_create='sudo timeshift --create'
alias snapshot_delete='sudo timeshift --delete'
alias setPL='setxkbmap -layout pl'
alias setEN='setxkbmap -layout us'
alias git_sub='git submodule init && git submodule update'
alias cmake_cc='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
alias cmake_cc_ninja='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -GNinja ..'
alias pdf='zathura'
alias clip="xclip -selection c"
alias cl='clear'
alias here='pwd | thunar'

# For docker
alias xhost_init='xhost +local:docker'
alias d_gui='docker run -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" '
alias d_il='docker image list'
alias d_ps='docker ps -a'
alias d_prune='docker container prune'
#alias d_rm='docker rmi $(docker images -f "dangling=true" -q)'

# ---------------

# --- Exports ---
export CMAKE_GENERATOR='Unix Makefiles'
set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set bashrc $HOME/.bashrc
set -gx CC clang
set -gx CXX clang++
set -gx MAKEFLAGS -j(nproc)
# ---------------

# --- Functions ---
function export_clang
  set -gx CC clang
  set -gx CXX clang++
end

function export_gcc
  set -gx CC gcc
  set -gx CXX g++
end

function set_python310
  sudo rm /usr/bin/python
  sudo rm /usr/bin/python3
  sudo ln -s /usr/bin/python3.10 /usr/bin/python3
  sudo ln -s /usr/bin/python3.10 /usr/bin/python
end

function set_python38 
  sudo rm /usr/bin/python
  sudo rm /usr/bin/python3
  sudo ln -s /usr/bin/python3.8 /usr/bin/python3
  sudo ln -s /usr/bin/python3.8 /usr/bin/python
end

function ros_init
  set -gx ROS_DOMAIN_ID 42
  bass source /opt/ros2/galactic/setup.bash
end
# -----------------

# --- Fish settings ---
function fish_greeting; end
set theme_newline_prompt "->"
set theme_newline_cursor yes
set fish_greeting ""
set theme_display_user yes
set theme_display_hostname yes
set theme_title_use_abbreviated_path no
set theme_display_git_default_branch yes
set fish_prompt_pwd_dir_length 0
if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ---------------------

setPL

#
# END OF FILE
#
