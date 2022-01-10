#!/usr/bin/env bash

function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

pluginsZsh="plugins=(\n\tgit\n\tbundler\n\tdotenv\n\tmacos\n\trake\n\truby\n\tzsh-syntax-highlighting\n\tzsh-autosuggestions\n)"
clear
echo "<================================ customizing your terminal ================================>"

apt update
apt upgrade -y
apt install vim -y
apt install curl
apt-get install zsh -y
apt-get install git-core -y
apt install wget
wget -P ${ZDOTDIR:-$HOME} https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

echo "

Enter the theme you want to put on your terminal by default agnoster will
come as the main theme.
"
if [[ "yes" == $(ask_yes_or_no "want to change the default Zsh theme?") ]]
then
	read -p "Theme: " themeZsh
	if [ -n "$themeZsh" ]; then
		sed -i "s|robbyrussell|$themeZsh|" ${ZDOTDIR:-$HOME}/.zshrc
	else
		themeZsh="agnoster"
		sed -i "s|robbyrussell|$themeZsh|" ${ZDOTDIR:-$HOME}/.zshrc
	fi
else
	echo "

<================================ OK ================================>

"
fi

sed -i "s|plugins=(git)|$pluginsZsh|" ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-$HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZDOTDIR:-$HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "

<================================ OK ================================>

"
if [[ "yes" == $(ask_yes_or_no "do you want to have the logo of your Linux distribution?") ]]
then
	apt-get install screenfetch -y
	echo "
screenfetch" >> ${ZDOTDIR:-$HOME}/.zshrc
fi

echo "

<================================ OK ================================>

"

if [[ "yes" == $(ask_yes_or_no "do you want to install with vim plugins?") ]]
then
    cp .vimrc ${ZDOTDIR:-$HOME}
else
	echo "No plugins"
fi

cp ${ZDOTDIR:-$HOME}
echo "
sudo zsh" >> ../.bashrc;

clear
zsh
