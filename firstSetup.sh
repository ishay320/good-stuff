#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    git cmake make gcc g++ clang gdb valgrind \
    python3 python-is-python3 \
    wget curl nodejs \
    gnuplot-qt tmux htop

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# fix the clock desync
timedatectl set-local-rtc 1 --adjust-system-clock

# install vscode
sudo snap install --classic code
gsettings set org.gnome.shell.keybindings move-to-workspace-up "[]"
gsettings set org.gnome.shell.keybindings move-to-workspace-down "[]"
echo "Check that the 'ctrl + alt + shift + up/down' hase been removed"

echo "Download the newest in https://github.com/hluk/CopyQ"
sudo apt install copyq -y
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"
echo "Don't forget to go to copyq setting and add 'super + v' shortcut and autostart"
echo "You need to fix the autostart :  in ~/.config/autostart/copyq.desktop: Exec=env QT_QPA_PLATFORM=xcb copyq"

## Insert custom less colors for man

# Path to the startup file
startup_file="$HOME/.bashrc"

# Check if the colors are already added
if grep -Fxq "# Custom less colors" "$startup_file"; then
    echo "Colors already added to $startup_file"
else
    cat <<EOF >>"$startup_file"
# Custom less colors
default=\$(tput sgr0)
red=\$(tput setaf 1)
green=\$(tput setaf 2)
purple=\$(tput setaf 5)
orange=\$(tput setaf 9)

export PAGER=less
export LESS_TERMCAP_mb=\${red}
export LESS_TERMCAP_md=\${orange}
export LESS_TERMCAP_me=\${default}
export LESS_TERMCAP_se=\${default}
export LESS_TERMCAP_so=\${purple}
export LESS_TERMCAP_ue=\${default}
export LESS_TERMCAP_us=\${green}
EOF
    echo "Colors added to $startup_file"
fi

## Custom tmux setting
cat <<EOF >>"$startup_file"
# Less scrall in tmux
export LESS='--mouse'
EOF

TMUX_CONF="${HOME}"/.tmux.conf
cat <<EOF >>"${TMUX_CONF}"
set -g mouse on
set -s set-clipboard external
EOF

tmux source "${TMUX_CONF}"

