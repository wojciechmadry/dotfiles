# My linux configuration files

`make install` - install config

`make backup` - backup config

## [ST - Simple Terminal](https://github.com/wojciechmadry/st)

**Requires**: [JetBrains Mono Nerd Font
](https://www.nerdfonts.com/font-downloads)

## [DWM](https://github.com/wojciechmadry/dwm) && [slstatus](https://github.com/wojciechmadry/slstatus)
![dwm_sls](pictures/dwm_sls.png)


## i3 and Picom [Deprecated]

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
