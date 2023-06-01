#
# ~/.bashrc
#

# Export ssh auth socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set default EDITOR
export EDITOR='nvim'
export VISUAL='nvim'

# Debug info link
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"  


# Set default compilers
export CC=clang
export CXX=clang++

# Add additional path in PATH
set PATH "$PATH:/home/"$USER"/.local/bin"

# Run fish shell
fish

