QUICKSCRIPTS="random_album.zsh

"
SCRIPTS=$(ls $HOME/Scripts/)
SCRIPT=$(ls $HOME/Scripts | dmenu -i -l 15)
zsh $HOME/Scripts/$SCRIPT
