#!/usr/bin/env bash
source configColor.ini
source ./progress_bar.sh

function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

pluginsZsh="plugins=(\n\tgit\n\tbundler\n\tdotenv\n\tmacos\n\trake\n\truby\n\tzsh-syntax-highlighting\n\tzsh-autosuggestions\n)"

source ~/.oh-my-zsh/tools/uninstall.sh
rm -rf ~/.oh-my-zsh
rm ~/.zshrc

sudo apt remove zsh -y;  sudo apt purge zsh -y; sudo apt autoremove -y

clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"
draw_progress_bar 0
apt update
draw_progress_bar 20
apt upgrade -y
draw_progress_bar 35
apt install vim -y
draw_progress_bar 40
apt install curl
draw_progress_bar 45
apt-get install zsh -y
draw_progress_bar 50
apt-get install git-core -y
apt install wget
draw_progress_bar 53
wget -P ${ZDOTDIR:-$HOME} https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"
echo -e "

Enter the theme you want to put on your terminal by default agnoster will
come as the main theme.
${BIWhite}
"
draw_progress_bar 57
if [[ "yes" == $(ask_yes_or_no "want to change the default Zsh theme?") ]]
then
	echo -e "
${Color_Off}${On_Black}root@ubuntu ${Black}${On_Blue} ~/Oh_My_ZSH_Vim ${Blue}${On_Yellow}${Black}${On_Yellow}  master ± ${Yellow} ${Green}agnoster${Color_Off}

"
	read -p "Theme: " themeZsh
	if [ -n "$themeZsh" ]; then
		sed -i "s|robbyrussell|$themeZsh|" ${ZDOTDIR:-$HOME}/.zshrc
		block_progress_bar 60
	else
		themeZsh="agnoster"
		sed -i "s|robbyrussell|$themeZsh|" ${ZDOTDIR:-$HOME}/.zshrc
		block_progress_bar 60
	fi
else
	echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
	block_progress_bar 60
fi
clear
block_progress_bar 60
sed -i "s|plugins=(git)|$pluginsZsh|" ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-$HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
block_progress_bar 70
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZDOTDIR:-$HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
block_progress_bar 75
echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"
block_progress_bar 75
if [[ "yes" == $(ask_yes_or_no "do you want to have the logo of your Linux distribution?") ]]
then
	var=$(grep -c screenfetch ${ZDOTDIR:-$HOME}/.zshrc)
	apt-get install screenfetch -y
	if [[ 0 -eq ${var} ]]
	then
		echo "
screenfetch" >> ${ZDOTDIR:-$HOME}/.zshrc
	elif [[ 1 -gt ${var} ]]
	then
		sed -i "s|screenfetch||" ${ZDOTDIR:-$HOME}/.zshrc
		echo "
screenfetch" >> ${ZDOTDIR:-$HOME}/.zshrc
	fi
	block_progress_bar 80
else
	echo "ok :("
	block_progress_bar 80
fi

echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"
block_progress_bar 85
if [[ "yes" == $(ask_yes_or_no "do you want to install with vim plugins?") ]]
then
    cp .vimrc ${ZDOTDIR:-$HOME}
	block_progress_bar 90
else
	echo "No plugins"
	block_progress_bar 90
fi

cp ${ZDOTDIR:-$HOME}
block_progress_bar 92
echo "
sudo zsh" >> ../.bashrc;
block_progress_bar 95

clear
block_progress_bar 100
echo -e "
${Green}
<================================ DONE ================================>
${Color_Off}
"

zsh
