#!/bin/bash

#####################################################
# trudeGnome.sh by @TrudeEH                         #
# This is the official install script for TrudeOS   #
#    Tested on Ubuntu 20.10                         #
#    	       Ubuntu 20.04                         #
#####################################################

sudo aaaaaaaaaaaaaaaa &> /dev/null

# ----] Functions [----
error_check(){

    if [ $? == 0 ]
    then
        echo " done"
    else
        echo " error"
    fi
}

system_update(){

	echo "[+] Updating the system base..."
	echo -ne '[.........................]\r'
	sudo apt update -y &> /dev/null
	echo -ne '[#####....................]\r'
	sudo apt upgrade -y &> /dev/null
	echo -ne '[##########...............]\r'
	sudo apt dist-upgrade -y &> /dev/null
	echo -ne '[################.........]\r'
	sudo apt autoremove -y &> /dev/null
	echo -ne '[#####################....]\r'
	sudo apt autoclean -y &> /dev/null
	echo -ne '[#########################]\r'
	echo -ne '\n'
}

gnome_extras(){
	while [ True ]
	do

	clear
	echo "############################"
	echo "# Gnome Extras             #"
	echo "############################"
	echo "# 1) Install Extras        #"
	echo "# 2) Install Icon theme    #"
	echo "# 3) Install Gnome-Tweaks  #"
	echo "# 4) Install Exten.Support #"
	echo "############################"
	echo "# a) All                   #"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  1)
    	sudo apt install -y git htop preload ubuntu-restricted-extras
    	;;
      2)
		git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
		cd Tela-circle-icon-theme ; ./install.sh ; cd .. ; rm -rf Tela-circle-icon-theme
		gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dark' # Apply the theme
    	;;
      3)
		sudo apt install -y gnome-tweaks
		;;
	  4)
		sudo apt install -y gnome-shell-extensions chrome-gnome-shell
		;;
      a)
		sudo apt install -y git htop preload ubuntu-restricted-extras
		git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
		cd Tela-circle-icon-theme ; ./install.sh ; cd .. ; rm -rf Tela-circle-icon-theme
		gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dark' # Apply the theme
		sudo apt install -y gnome-tweaks gnome-shell-extensions chrome-gnome-shell
		;;
  	  d)
    	break
    	;;
  	  *)
    	;;
	esac
	done
}

install_apps(){

	while [ True ]
	do

	clear
	echo "############################"
	echo "# Install Apps             #"
	echo "############################"
	echo "# 1) Telegram              #"
	echo "# 2) Discord               #"
	echo "# 3) Steam                 #"
	echo "# 4) Zoom                  #"
	echo "# 5) MailSpring            #"
	echo "# 6) Spotify               #"
	echo "# 7) Sublime               #"
	echo "############################"
	echo "# a) All                   #"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  1)
    	sudo snap install telegram-desktop
    	;;
  	  2)
    	sudo snap install discord
    	;;
  	  3)
    	sudo add-apt-repository multiverse
    	sudo apt update
    	sudo apt install steam -y
    	;;
      4)
    	sudo snap install zoom-client
    	;;
      5)
    	sudo snap install mailspring
    	;;
  	  6)
    	sudo snap install spotify
    	;;
   	  7)
    	sudo snap install sublime-text --classic
    	;;
  	  a)
		sudo add-apt-repository multiverse
    	sudo apt update
    	sudo apt install steam -y
    	sudo snap install telegram-desktop
    	sudo snap install discord
    	sudo snap install zoom-client
    	sudo snap install mailspring
    	sudo snap install spotify
    	sudo snap install sublime-text --classic
    	;;
  	  d)
    	break
    	;;
  	  *)
    	;;
	esac
	done
}

web_apps(){

	while [ True ]
	do

	clear
	echo "############################"
	echo "# Web Shortcuts            #"
	echo "############################"
	echo "# 1) Create a shortcut     #"
	echo "# 2) Remove a shortcut     #"
	echo "# 3) List shortcuts        #"
	echo "############################"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  1)
    	read -p "Website name: " name
    	read -p "Website url: " url
    	echo -e """
[Desktop Entry]
Comment=Open $name website
Terminal=false
Name=$name (WEB)
Exec=firefox $url
Type=Application
Icon=applications-internet
NoDisplay=false
    	""" > ~/.local/share/applications/$name.desktop
    	;;
  	  2)
		ls ~/.local/share/applications/
		echo
    	read -p "Website name: " name
    	rm ~/.local/share/applications/$name.desktop
    	echo "Shortcut removed"
    	sleep 2
    	;;
   	  3)
		ls ~/.local/share/applications/
		echo
		read -p "Press [Enter] to go back"
		;;
  	  d)
    	break
    	;;
  	  *)
    	;;
	esac
	done
}

android_apps(){

	while [ True ]
	do

	clear
	echo "############################"
	echo "# Android apps             #"
	echo "############################"
	echo "# 1) Install Anbox         #"
	echo "# 2) Install APK           #"
	echo "############################"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  1)
    	sudo apt update
		sudo snap install --beta --devmode anbox
		sudo apt install dbus-x11 adb -y
		export $(dbus-launch)
		anbox session-manager &
		anbox.appmgr &
    	;;
      2)
		anbox session-manager
		read -p "APK location: " apk
		echo "[+] Installing $name"
		adb install $apk
		sleep 2
    	;;
  	  d)
    	break
    	;;
  	  *)
    	;;
	esac
	done
}

windows_apps(){
	
	while [ True ]
	do

	clear
	echo "############################"
	echo "# Windows Support          #"
	echo "############################"
	echo "# 1) Install Wine          #"
	echo "# 2) Install Mono          #"
	echo "# 3) Install Lutris        #"
	echo "############################"
	echo "# a) All                   #"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  1)
		sudo apt install wine -y
    	;;
      2)
		sudo apt install mono-complete -y
    	;;
      3)
		sudo add-apt-repository ppa:lutris-team/lutris
		sudo apt update
		sudo apt install lutris -y
		;;
	  a)
		sudo apt install wine -y
		sudo apt install mono-complete -y
		sudo add-apt-repository ppa:lutris-team/lutris
		sudo apt update
		sudo apt install lutris -y
		;;
  	  d)
    	break
    	;;
  	  *)
    	;;
	esac
	done
}

#############################################################
#                        MAIN MENU                          #
#############################################################

while [ True ]
do

clear
echo "############################"
echo "# TrudeGnome - Main menu   #"
echo "############################"
echo "# 1) Update System         #"
echo "# 2) Gnome Extras          #"
echo "# 3) Install apps          #"
echo "# 4) Create Web shortcuts  #"
echo "# 5) Install drivers       #"
echo "# 6) Windows apps support  #"
echo "# 7) Android apps support  #"
echo "############################"
echo "# a) All                   #"
echo "# d) Done                  #"
echo "############################"

read -p ">>> " choice

clear
case $choice in
  1)
    system_update
    ;;
  2)
    gnome_extras
    ;;
  3)
    install_apps
    ;;
  4)
    web_apps
    ;;
  5)
	sudo software-properties-gtk
	;;
  6)
	windows_apps
	;;
  7)
	android_apps
	;;
  a)
	system_update
	gnome_extras
	install_apps
	web_apps
	sudo software-properties-gtk
	android_apps
    ;;
  d)
    break
    ;;
  *)
    ;;
esac
done
