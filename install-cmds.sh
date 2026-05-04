#!/bin/sh

yay -Sy aseprite \
ttf-ms-fonts \
mangowc-git

pacman -Sy neovim \
which \
starship \
dua-cli \
ttf-jetbrains-mono \
ttf-nerd-fonts-symbols \
obsidian \
chezmoi \
lazygit \
base-devel \
lxappearance \
feh \
xfce4-power-manager \
zathura \
swappy \
slurp \
fzf \
cliphist \
dunst \
mpd \
tree-sitter \
tree-sitter-cli \
tree-sitter-lua \
webcamize \
tokei \
openssl \
tealdeer \
anki \
rmpc \
less \
raylib \
bear \
tlp \ # only really needed for laptop
mpd-mpris
wtype
#awesome \
#hyprland \

mkdir ~/Pictures/Screenshots

mkdir ~/Pictures/Wallpapers/
cd ~/Pictures/Wallpapers/
git clone https://github.com/Lochi-dot-JPEG/Wallpapers

# install pywal16 to .local/bin
# ctrl + S, I in tmux to install plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/supermariofps/hatsune-miku-windows-linux-cursors /tmp/mikucursors 
cp /tmp/mikucursors/miku-cursor-linux ~/.local/share/icons/

# enable tlp.service
# enable NetworkManager-dispatcher.service
# mask systemd-rfkill.service as per https://wiki.archlinux.org/title/TLP
# mask systemd-rfkill.socket
