# Script to provision basic dev environment
# and deploy dotfiles
#
PROVISION  := vim tmux vundle tig
DEPLOY     := tmux bash vim git

all: provision deploy
provision: update-packs $(PROVISION:%=provision-%)
deploy: $(DEPLOY:%=deploy-%)

# deploy rules
deploy-tmux:
	ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf

deploy-bash:
	touch ~/.bashrc
	ln -fs `pwd`/bash/bash_profile ~/.bash_profile

deploy-git:
	ln -fs `pwd`/git/gitconfig ~/.gitconfig

deploy-vim:
	ln -fs `pwd`/vim/vimrc ~/.vimrc
	vim +PluginInstall +qall

# provision rules
#
update-packs:
	sudo apt update

provision-tig:
	sudo apt install tig

provision-tmux:
	sudo apt install tmux

provision-vim:
	sudo apt install vim


provision-vundle:
	rm -rf ~/.vim/bundle/Vundle.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
