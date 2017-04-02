#!/bin/sh

# Symlink dotfiles.
echo "Linking dotfiles..."
FILES=".oh-my-zsh/custom/ssh-add.zsh .config/dunst/dunstrc .config/parcellite/parcelliterc .xinitrc .Xdefaults .vimrc .zlogin .zshrc .conkyrc .tmux.conf"
for F in $FILES; do
	if [ -e ~/$F ]; then
		echo ~/$F exists - backup created
		# Create dated backup.
		mv ~/$F ~/$F.$(date +%Y%m%d)
	else
		mkdir -p $(dirname ~/$F)
	fi
	ln -s $(pwd)/$F ~/$F
done
