help:
	@echo Dot files
	@echo make install	-	Install configuration files
	@echo make backup	-	Save configuration files
install:
	# .bashrc
	cp shell/.bashrc ~/
	cp -r shell/bashrc ~/
	# i3wm
	mkdir -p ~/.config/i3
	cp i3/config ~/.config/i3/
	cp i3/i3status-rs.conf ~/.config/i3/
	# NeoVim
	mkdir -p ~/.config/nvim
	cp nvim/init.lua ~/.config/nvim/
	# Alacritty
	mkdir -p ~/.config/alacritty
	cp alacritty/alacritty.yml ~/.config/alacritty/
	# Pico
	mkdir -p ~/.config/picom
	cp picom/config ~/.config/picom/
	# Rofi
	cp -r rofi ~/.config/
	# tmux
	cp tmux/.tmux.conf ~/
	# Install .ssh conf
	mkdir -p ~/.ssh
	cp git_ssh/config ~/.ssh/
backup:
	# .bashrc
	cp ~/.bashrc shell/
	cp -r ~/bashrc shell/
	# i3wm
	cp ~/.config/i3/config i3/
	cp ~/.config/i3/i3status-rs.conf i3/
	# NeoVim
	cp ~/.config/nvim/init.lua nvim/
	# Alacritty
	cp ~/.config/alacritty/alacritty.yml alacritty/
	# Pico
	cp ~/.config/picom/config picom/
	# Rofi
	cp -r ~/.config/rofi .
	# tmux
	cp ~/.tmux.conf tmux/
