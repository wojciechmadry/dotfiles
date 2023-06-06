#!/bin/bash
# Functions
#

# Use clang compiler
function export_clang() {
	export CC=clang
	export CXX=clang++
}

export -f export_clang

# Use gcc compiler
function export_gcc() {
	export CC=gcc
	export CXX=g++
}

export -f export_gcc

# Set Python compiler to 3.10
function set_python310() {
	sudo rm /usr/bin/python
	sudo rm /usr/bin/python3
	sudo ln -s /usr/bin/python3.10 /usr/bin/python3
	sudo ln -s /usr/bin/python3.10 /usr/bin/python
}

export -f set_python310

# Set Python compiler to 3.8
function set_python38() {
	sudo rm /usr/bin/python
	sudo rm /usr/bin/python3
	sudo ln -s /usr/bin/python3.8 /usr/bin/python3
	sudo ln -s /usr/bin/python3.8 /usr/bin/python
}

export -f set_python38

# Use headphones (My razer headphones)
function sound_headphones() {
	set headphones_name "$(pactl list | grep -E 'Name: .+output.+usb-Razer.+analog-stereo$' | cut -d ' ' -f 2)"
	pactl set-default-sink "$headphones_name"
}

export -f sound_headphones

# Use speaker (My hdmi monitor speaker)
function sound_speaker() {
	set speaker_name "$(pactl list | grep -E 'Name: .+output.+hdmi-stereo$' | cut -d ' ' -f 2)"
	pactl set-default-sink "$speaker_name"
}

export -f sound_speaker

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

