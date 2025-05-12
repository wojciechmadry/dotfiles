#!/bin/bash
# Export variables
#

# Default editor
export EDITOR='nvim'
export VISUAL='nvim'

# Default C++ compiler
export CC=clang
export CXX=clang++
export MAKEFLAGS=-j$(nproc)

# CMake options
export CMAKE_GENERATOR='Unix Makefiles'

# Debug info link (for valgrind problem)
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"

# Export locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Append PATH
export PATH="$PATH:/home/"$USER"/.local/bin"
