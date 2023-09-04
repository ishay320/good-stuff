#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S \
	git cmake make gcc clang gdb valgrind \
	python3 nodejs npm \
	wget curl wireshark-qt \
	gnuplot tmux xclip htop \
	man-pages man-db xdg-utils \
	bash-completion copyq \
	dosfstools

sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/yay-git.git
cd ./yay-git || exit 1
makepkg -si
cd .. # ./yay-git

# Hebrew fonts
yay -S ttf-ms-fonts culmus

# Install chrome
yay -S google-chrome

# Install vscode
yay -S visual-studio-code-bin
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['']"

# Gnome seting
gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close

# Add copyq on super+V and terminal on ctrl+alt+T
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kgx'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'copyq'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'copyq show'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>v'

# Fix for copyq shortcut
gsettings set org.gnome.shell.keybindings toggle-message-tray "['']"

# Add dash and desktop icons via gnome-extensions

# Fix `xdg-open` open code instead of nautilus
xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime default nvim.desktop application/x-shellscript
xdg-mime default nvim.desktop text/plain

# Man database re cache
sudo mandb

// TODO: add lazyvim installation and my custom setting
python -m pip install neovim
sudo pacman -S lazygit

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
