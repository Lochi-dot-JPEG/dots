#!/bin/sh

cd $HOME/Brain/

echo "Pulling..."
git pull
printf "Status:\n\n"
git add .
git status --short

while true; do
    echo ""
    read -p "Do you want to stage all and commit? (y/n) (l)azygit " yn
    case $yn in
        [yY] ) echo "Proceeding..."; break;;
        [nN] ) echo "Exiting..."; git restore --staged .; exit;;
        [lL] ) lazygit; exit;;
        * ) echo "Invalid response. Please answer 'l', 'y' or 'n'.";;
    esac
done
git commit -m "Automated commit $(date +%F)"
git push
lazygit
