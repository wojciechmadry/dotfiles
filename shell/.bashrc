#!/bin/bash
# ~/.bashrc
#


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Export variables
source ~/bashrc/export.sh

# Source alias
source ~/bashrc/alias.sh

# Export functions
source ~/bashrc/functions.sh

# Set lang to PL
setPL

# Private sources
PRIVATE_SOURCE_FILE='/home/'$USER'/.bashrc_private.sh'
[[ -f "$PRIVATE_SOURCE_FILE" ]] || touch "$PRIVATE_SOURCE_FILE" && chmod +x "$PRIVATE_SOURCE_FILE"
source "$PRIVATE_SOURCE_FILE"


#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
