#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S bash-completion copyq
sudo pacman -S --needed base-devel git

git clone https://aur.archlinux.org/yay-git.git
cd ./yay-git || exit 1
makepkg -si
cd .. # ./yay-git

yay -S google-chrome
yay -S visual-studio-code-bin

sudo pacman -S git cmake make gcc clang gdb valgrind \
	python3 wget curl nodejs tmux htop \
	gnuplot wireshark-qt \
	man-pages man-db xclip xdg-utils

# add the terminal `kgx` to open on `ctrl+alt+T`
# add dash and desktop icons via gnome-extensions
# remove shortcut using `dconf-editor` for use in vscode - org.gnome.desktop.wm.keybindings


# fix xdg-open
xdg-mime default org.gnome.Nautilus.desktop inode/directory
