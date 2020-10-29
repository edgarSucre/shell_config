#!/usr/bin/bash

function virtualbox {
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt update -y; sudo apt install virtualbox-6.1 -y    
}

function installgo {
    wget https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
    rm go1.15.3.linux-amd64.tar.gz
    //TODO configure golang paths    
}

function chrome {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
}

function print {
    BG='\e[104m'
    NC='\033[0m'
    BOLD='\e[1m'
    echo -e "${BG}${BOLD}$1${NC}"  
}



print 'Updating base installation'
sudo apt update -y; sudo apt upgrade -y

print 'Install build essentials'
sudo apt install wget build-essential libtool automake git pkg-config -y

print 'Install tools'
sudo add-apt-repository universe
sudo apt install vlc gimp gparted synaptic ubuntu-restricted-extras preload -y

print 'Install themes'
sudo add-apt-repository universe
sudo add-apt-repository ppa:numix/ppa
sudo apt update -y
sudo apt install gnome-tweak-tool gnome-shell-extensions -y
sudo apt install numix-gtk-theme numix-icon-theme-circle -y

print 'Install Chrome'
#chrome

while true; do
    read -p "Install VirtualBox y/n " yn
    case $yn in
        [Yy]* ) virtualbox; break;;
        [Nn]* ) break;;
        * ) print 'Please answer yes or no.';;
    esac
done

while true; do
    read -p "Install Golang y/n " yn
    case $yn in
        [Yy]* ) installgo; break;;
        [Nn]* ) break;;
        * ) print 'Please answer yes or no.';;
    esac
done

