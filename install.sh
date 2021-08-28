#!/usr/bin/env bash
set -e

# TODO:	- pegar configs gerada pelo nvidia x config pra resolver o thearing
#		- pegar configs do wallpaper, tanto para o desktop quanto para o lock screen 

	clear

	echo "# Instalar Polybar #"
	
	sleep 3s
	
	sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev wmctrl slop -y
	
	clear
	
	cd /tmp/posInstall/installers/polybar
	mkdir build && cd build	
	cmake ..
	make -j$(nproc)
	sudo make install
	
	clear

	echo "# Polybar instalado #"	
	echo "# Atualizar sistema #"

	sleep 3s

	sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

	clear

	echo "# Sistema atualizado #"
	echo "# Instalar Rofi #"

	sleep 3s
	
	sudo apt install make autoconf automake pkg-config flex bison check libxkbcommon-dev libxkbcommon-x11-dev libxcb-xinerama0-dev libpango1.0-dev libstartup-notification0-dev  libgdk-pixbuf2.0-dev -y
	cd /tmp/posInstall/installers/rofi
	mkdir build && cd build
	../configure --disable-check
	make
	sudo make install

	clear

	echo "# Rofi instalado #"
	echo "# Instalar Betterlockscreen #"
	
	sleep 3s
	
	sudo apt install gcc make libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxcb-xtest0-dev libjpeg-dev -y
	
	clear

	cd /tmp/posInstall/installers/i3lock-color
	./install-i3lock-color.sh

	clear
	
	cd /tmp/posInstall/installers/betterlockscreen
	chmod 777 betterlockscreen
	sudo cp betterlockscreen /usr/local/bin/
	sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
	systemctl enable betterlockscreen@$USER

	clear

	echo "# Betterlockscreen instalado #"
	echo "# Instalar Skippy-xd #"

	sudo apt install i3lock imagemagick xdotool -y

	clear

	sleep 3s
	
	cd /tmp/posInstall/installers/
	sudo dpkg -i libpng12-0.deb
	sudo dpkg -i skippy-xd.deb
	cd /tmp/posInstall/.config/
	sudo chmod 777 skippy-xd-fix	
	sudo cp skippy-xd-fix /usr/local/bin/
	
	clear

	echo "# Skippy-xd instalado #"
	echo "# Instalar Clipmenu #"
	
	sleep 3s

	sudo apt install libxcomposite-dev xsel -y

	clear

	cd /tmp/posInstall/installers/clipnotify
	sudo cp -f clipnotify /usr/local/bin
	cd /tmp/posInstall/installers/clipmenu
	sudo make install
	
	clear
	
	echo "# Clipmenu instalado #"
	echo "# Instalar base BSPWM #"

	sleep 3s

	sudo apt install bspwm sxhkd mate-polkit feh nitrogen lxappearance flameshot compton dunst numlockx libnotify-bin playerctl peek -y
	
	clear
	
	cd /tmp/posInstall/installers/
	sudo dpkg -i papirus-icon.deb
	sudo dpkg -i papirus-folders.deb

	clear

	papirus-folders -C yaru --theme Papirus-Dark

	clear
	echo "# Base BSPWM instalada #"
	echo "# Instalacoes snap #"
	
	sleep 3s

	sudo apt install snapd -y
	sudo snap install ksuperkey
	sudo snap install guiscrcpy
	sudo snap install photogimp

	clear

	echo "# pacotes snaps instalados #"
	echo "# Sistema atualizado #"
	echo "# Base BSPWM instalada #"	
	echo "# Apps complementares instalados #"
	
	sleep 3s

	echo "# Copiar fontes #"
	
	sleep 3s

	mkdir ~/.local/share/fonts
	sudo cp -r /tmp/posInstall/fonts/* ~/.local/share/fonts
	
	clear

	echo "# Fontes copiadas #"
	echo "# Copiar personalizacoes #"
	
	sleep 3s

	cp -r /tmp/posInstall/.config/bspwm ~/.config
	cp -r /tmp/posInstall/.config/sxhkd ~/.config
	cp -r /tmp/posInstall/.config/rofi ~/.config	
	cp -r /tmp/posInstall/.config/dunst ~/.config
	cp -r /tmp/posInstall/.config/polybar ~/.config
	cp -r /tmp/posInstall/.config/skippy-xd ~/.config
	cp -rf /tmp/posInstall/.config/gtk-3.0/ ~/.config/
	cp -rf /tmp/posInstall/.themes/ ~/
	
	clear

	echo "# Personalizacoes copiadas #"
	echo "# Script pos instalacao concluido #"

	notify-send "Pos instalacao concluida" "Reinicie o sistema e escolha o bspwm na tela de login"