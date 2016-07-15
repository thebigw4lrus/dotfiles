ALL   := tmux bash vim git 

install: $(ALL:%=install-%)

install-tmux:
	ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf

install-bash:
	touch ~/.bashrc
	ln -fs `pwd`/bash/bashrc ~/.bashrc

install-git:
	ln -fs `pwd`/git/gitconfig ~/.gitconfig

install-vim:
	ln -fs `pwd`/vim/vimrc ~/.vimrc
	vim +PluginInstall +qall
