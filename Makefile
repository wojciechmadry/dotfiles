help:
	@echo Dot files
	@echo make install	-	Install configuration files
	@echo make backup	-	Save configuration files
install:
	# .bashrc
	cp shell/.bashrc ~/
	cp -r shell/bashrc ~/
	# NeoVim
	mkdir -p ~/.config/nvim
	cp nvim/init.lua ~/.config/nvim/
	# tmux
	cp tmux/.tmux.conf ~/
	# Install .ssh conf
	mkdir -p ~/.ssh
	cp -n git_ssh/config ~/.ssh/
backup:
	# .bashrc
	cp ~/.bashrc shell/
	cp -r ~/bashrc shell/
	# NeoVim
	cp ~/.config/nvim/init.lua nvim/
	# tmux
	cp ~/.tmux.conf tmux/
