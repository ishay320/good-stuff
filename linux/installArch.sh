#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S \
	git cmake make gcc clang gdb valgrind \
	python3 nodejs \
	wget curl wireshark-qt \
	gnuplot tmux xclip htop \
	man-pages man-db xdg-utils \
	bash-completion copyq

sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/yay-git.git
cd ./yay-git || exit 1
makepkg -si
cd .. # ./yay-git

# install chrome
yay -S google-chrome

# install vscode
yay -S visual-studio-code-bin
echo "remove shortcut using 'dconf-editor' for use in vscode - org.gnome.desktop.wm.keybindings"

# add the terminal `kgx` to open on `ctrl+alt+T`
# add dash and desktop icons via gnome-extensions

# fix `xdg-open` open code instead of nautilus
xdg-mime default org.gnome.Nautilus.desktop inode/directory
