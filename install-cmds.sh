#!/bin/sh

yay -Sy aseprite \
betterdiscord-installer-bin \
activitywatch-bin \
pnmixer \
ttf-ms-fonts \
mpdris2

pacman -Sy neovim \
awesome \
which \
dua-cli \
ttf-jetbrains-mono \
ttf-nerd-fonts-symbols \
obsidian \
chezmoi \
lazygit \
base-devel \
lxappearance \
feh \
flameshot \
xfce4-power-manager \
variety \
swappy \
slurp \
hyprland \
cliphist \
swaync \
termdown \
tlp \ # only really needed for laptop
wtype

mkdir ~/Pictures/Screenshots

mkdir ~/Pictures/Wallpapers/
cd ~/Pictures/Wallpapers/
git clone https://github.com/Lochi-dot-JPEG/Wallpapers

# install pywal16 to .local/bin
# ctrl + S, I in tmux to install plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

systemctl --user enable --now mpDris2.service
# enable mpDris2 for showing mpd in waybar
#
git clone https://github.com/supermariofps/hatsune-miku-windows-linux-cursors /tmp/mikucursors 
cp /tmp/mikucursors/miku-cursor-linux ~/.local/share/icons/

# enable tlp.service
# enable NetworkManager-dispatcher.service
# mask systemd-rfkill.service as per https://wiki.archlinux.org/title/TLP
# mask systemd-rfkill.socket
