#!/bin/bash

#####################################################
# trudeGnome.sh by @TrudeEH                         #
# This is the official install script for TrudeOS   #
#    Tested on Ubuntu 20.10                         #
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

trude_gnome(){
	
	sudo apt install -y git htop preload ubuntu-restricted-extras

	# Tela circle icon theme
	git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
	cd Tela-circle-icon-theme ; ./install.sh ; cd .. ; rm -rf Tela-circle-icon-theme
	gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dark' # Apply the theme
	error_check
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
	echo "# c) Create a shortcut     #"
	echo "# r) Remove a shortcut     #"
	echo "############################"
	echo "# d) Done                  #"
	echo "############################"

	read -p ">>> " choice

	clear
	case $choice in
  	  c)
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
  	  r)
    	read -p "Website name: " name
    	rm ~/.local/share/applications/$name.desktop
    	echo "Shortcut removed"
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
echo "# 2) Install TrudeGnome    #"
echo "# 3) Install apps          #"
echo "# 4) Create Web shortcuts  #"
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
    trude_gnome
    ;;
  3)
    install_apps
    ;;
  4)
    web_apps
    ;;
  a)
	system_update
	trude_gnome
	install_apps
	web_apps
    ;;
  d)
    break
    ;;
  *)
    ;;
esac
done
