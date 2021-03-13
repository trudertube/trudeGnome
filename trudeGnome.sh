#!/bin/bash

#####################################################
# trudeGnome.sh by @TrudeEH                         #
# This is the official install script for TrudeOS   #
#    Tested on Ubuntu 20.10                         #
#####################################################

# ----] Functions [----
error_check(){
    if [ $? == 0 ]
    then
        echo " done"
    else
        echo " error"
    fi
}

sudo aaaaaaaa &> /dev/null

# ----] System update ]----
echo
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
echo

sudo apt install -y git htop preload ubuntu-restricted-extras

# Tela circle icon theme
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme ; ./install.sh ; cd .. ; rm -rf Tela-circle-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dark' # Apply the theme
error_check

# ----] APPS [----

while [ True ]
do

clear
echo "############################"
echo "# Select apps to install   #"
echo "############################"
echo "# 1) Telegram              #"
echo "# 2) Discord               #"
echo "# 3) Steam                 #"
echo "# 4) Zoom                  #"
echo "# 5) MailSpring            #"
echo "# 6) Spotify               #"
echo "# a) All                   #"
echo "# d) Done                  #"
echo "############################"

read -p ">>> " choice

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
  a)
    sudo snap install telegram-desktop
    sudo snap install discord
    sudo add-apt-repository multiverse
    sudo apt update
    sudo apt install steam -y
    sudo snap install zoom-client
    sudo snap install mailspring
    sudo snap install spotify
    ;;
  d)
    break
    ;;
  *)
    ;;
esac
done

