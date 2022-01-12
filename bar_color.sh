#!/bin/bash
source configColor.ini

function test_() {
	string=""
	for (( iter = 0; iter < $2 ; iter++)) do
		string=$string"=="
	done
	echo -e "

	${3}<=${string} ${1} ${string}=>${Color_Off}

	"
}


function multicolor_() {
	array=(${Red} ${Green} ${Yellow} ${Blue} ${Purple} ${Cyan} ${White})
	arrayr=(${White} ${Cyan} ${Purple} ${Blue} ${Yellow} ${Green} ${Red})
	string=""

	for (( iter = 0;iter < $2 ; iter++)) do
		for (( i = 0, ne = 6; i < 3; i++, ne-- )) do
			sleep 0.3
			echo -ne "${Yellow}<${array[$i + 3]}==${array[$i]}===${array[$i + 1]}===${array[$i + 2]}===${array[$i + 3]}===${array[$i]}===${array[$i + 1]}===${array[$i + 2]}===${array[$i + 3]}===${array[$i]}===${array[$i + 1]}===${array[$i + 2]} ${Green}${1} ${arrayr[$ne - 2]}===${arrayr[$ne - 1]}===${arrayr[$ne]}===${arrayr[$ne - 3]}===${arrayr[$ne - 2]}===${arrayr[$ne - 1]}===${arrayr[$ne]}===${arrayr[$ne - 3]}===${arrayr[$ne - 2]}===${arrayr[$ne - 1]}===${arrayr[$ne]}==${Yellow}>${Color_Off}\r"
		done
	done
	echo ""
}

