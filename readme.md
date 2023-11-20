# My linux configuration files

`make install` - install config

`make backup` - backup config

## Alacritty

**Requires**: [JetBrains Mono Nerd Font
](https://www.nerdfonts.com/font-downloads)

## i3 and Picom

#### i3status-rust bar
![i3rs](pictures/i3bar-rust.png)

#### i3wm + Picom
![i3wmpicom](pictures/i3wm.png)

## TMux
![tmux](pictures/tmux.png)

## bashrc
![bashrc](pictures/bashrc.png)

## NeoVim
![nvim](pictures/nvim.png)

## Rofi
![rofi](pictures/rofi.png)

## Git ssh

Git configuration to detect the ssh key: `~/.ssh/github`
```
Match host=gitlab.com
   User git
   Hostname gitlab.com
   IdentityFile ~/.ssh/github
   TCPKeepAlive yes
   IdentitiesOnly yes
   AddKeysToAgent yes

Match host=github.com
   User git
   Hostname github.com
   IdentityFile ~/.ssh/github
   TCPKeepAlive yes
   IdentitiesOnly yes
   AddKeysToAgent yes
```
