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
	# Pico
	mkdir -p ~/.config/picom
	cp picom/config ~/.config/picom/
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
	# Pico
	cp ~/.config/picom/config picom/
	# tmux
	cp ~/.tmux.conf tmux/
