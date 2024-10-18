#!/usr/bin/env bash

# Exit on error and log all actions
set -e
exec > >(tee -i arch_installation.log)
exec 2>&1

echo "=== Arch Linux Installation Script ==="

# Function to configure pacman settings
configure_pacman() {
	echo "Configuring pacman settings..."
	sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
	sudo sed -i 's/#Color/Color/' /etc/pacman.conf
}

# Function to install packages with pacman
install_pacman_packages() {
	echo "Updating system and installing base packages..."
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm --needed \
		git cmake make gcc clang gdb valgrind \
		python3 nodejs npm wget curl wireshark-qt \
		gnuplot tmux xclip htop man-pages man-db \
		xdg-utils bash-completion copyq dosfstools \
		base-devel lazygit bear
}

# Function to install yay (AUR helper)
install_yay() {
	echo "Installing yay (AUR helper)..."
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git || exit 1
	makepkg -si --noconfirm
	cd .. && rm -rf yay-git
}

# Function to install AUR packages
install_aur_packages() {
	echo "Installing AUR packages..."
	yay -S --noconfirm ttf-ms-fonts culmus google-chrome visual-studio-code-bin otf-firamono-nerd ttf-3270-nerd
}

# Function to configure GNOME settings
configure_gnome() {
	echo "Configuring GNOME settings..."
	gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['']"

	# Custom keybindings
	gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'terminal'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kgx'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'

	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'copyq'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'copyq show'
	gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>v'

	# Fix for copyq shortcut
	gsettings set org.gnome.shell.keybindings toggle-message-tray "['']"
}

# Function to configure xdg-mime settings
configure_xdg() {
	echo "Configuring xdg-open defaults..."
	xdg-mime default org.gnome.Nautilus.desktop inode/directory
	xdg-mime default nvim.desktop application/x-shellscript
	xdg-mime default nvim.desktop text/plain
}

# Function to enable and start services
configure_services() {
	echo "Enabling and starting services..."
	sudo systemctl enable bluetooth.service
	sudo systemctl start bluetooth.service
}

# Function to update the man database
update_man_db() {
	echo "Updating man database..."
	sudo mandb
}

# Function to set custom fonts
set_custom_fonts() {
	echo "Setting custom font (FiraMono Nerd Font)..."
	gsettings set org.gnome.desktop.interface monospace-font-name 'FiraMono Nerd Font Mono 10'
}

configure_pacman
install_pacman_packages
install_yay
install_aur_packages
set_custom_fonts
configure_gnome
configure_xdg
configure_services
update_man_db
echo "Installation and configuration complete!"
