#!/usr/bin/env bash
source configColor.ini

function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"

apt update
apt upgrade -y
apt install vim -y
apt install curl

clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"
echo -e "

Enter the theme you want to put on your terminal by default agnoster will
come as the main theme.
${BIWhite}
"
if [[ "yes" == $(ask_yes_or_no "want to change the default Zsh theme?") ]]
then
	echo -e "
${Color_Off}${On_Black}root@ubuntu ${Black}${On_Blue} ~/Oh_My_ZSH_Vim ${Blue}${On_Yellow}${Black}${On_Yellow}  master ± ${Yellow} ${Green}agnoster${Color_Off}

"
	read -p "Theme: " themeZsh
	if [ -n "$themeZsh" ]; then
		echo "$themeZsh"
	else
		themeZsh="agnoster"
		echo "$themeZsh"
	fi
else
	echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
fi
sleep 2
clear
echo "ok"
echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
if [[ "yes" == $(ask_yes_or_no "do you want to have the logo of your Linux distribution?") ]]
then
	echo "ok"
fi

echo -e "
${Green}
<================================ OK ================================>
${Color_Off}
"
sleep 2
clear
echo -e "${Green}<${Yellow}================================${Color_Off} ${On_Red}${BIWhite}On_Redcustomizing your terminal${Color_Off} ${Yellow}================================${Green}>${Color_Off}

"

if [[ "yes" == $(ask_yes_or_no "do you want to install with vim plugins?") ]]
then
    echo "ok"
else
	echo "No plugins"
fi

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'

echo -e "
${Green}
<================================ DONE ================================>
${Color_Off}
"

