#!/bin/sh


pacman -Sy neovim \
which \
starship \
dua-cli \
zsh-autosuggestions \
zsh-syntax-highlighting \
zsh-completions \
chezmoi \
lazygit \
base-devel \
fzf \
cliphist \
dunst \
mpd \
tree-sitter \
tree-sitter-cli \
tree-sitter-lua \
tokei \
openssl \
tealdeer \
rmpc \
less \
raylib \
bear \
tlp \ # only really needed for laptop
mpd-mpris
wtype
#awesome \
#hyprland \

# Graphical
yay -Sy aseprite \
mangowc-git

pacman -S webcamize \
xfce4-power-manager \
zathura \
lxappearance \
obsidian \
ttf-jetbrains-mono \
ttf-nerd-fonts-symbols \
feh \
swappy \
slurp \
anki 

mkdir ~/Pictures/Screenshots

mkdir ~/Pictures/Wallpapers/
cd ~/Pictures/Wallpapers/
git clone https://github.com/Lochi-dot-JPEG/Wallpapers
