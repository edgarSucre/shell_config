#!/usr/bin/bash

function virtualbox {
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt update -y; sudo apt install virtualbox virtualbox-guest-additions-iso -y      
}

function installgo {
    wget https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
    rm go1.15.3.linux-amd64.tar.gz
    #TODO configure golang paths    
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

function installDocker {
    sudo apt remove docker docker-engine docker.io containerd runc
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt update -y; sudo apt install docker-ce docker-ce-cli containerd.io -y
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

function installNode {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
    print "Recuerda instalar Node 'nvm install node'"
}

print 'Updating base installation'
sudo apt update -y; sudo apt upgrade -y

print 'Install build essentials'
sudo apt install wget build-essential libtool automake git pkg-config apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

print 'Install tools'
sudo add-apt-repository universe
sudo apt install vlc gimp gparted synaptic ubuntu-restricted-extras preload -y

print 'Install themes'
sudo add-apt-repository universe
sudo add-apt-repository ppa:numix/ppa
sudo apt update -y
sudo apt install gnome-tweak-tool gnome-shell-extensions -y
sudo apt install numix-gtk-theme numix-icon-theme-circle -y

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

while true; do
    read -p "Install Chrome y/n " yn
    case $yn in
        [Yy]* ) chrome; break;;
        [Nn]* ) break;;
        * ) print 'Please answer yes or no.';;
    esac
done

while true; do
    read -p "Install Docker y/n " yn
    case $yn in
        [Yy]* ) installDocker; break;;
        [Nn]* ) break;;
        * ) print 'Please answer yes or no.';;
    esac
done

while true; do
    read -p "Install nvm y/n " yn
    case $yn in
        [Yy]* ) installNode; break;;
        [Nn]* ) break;;
        * ) print 'Please answer yes or no.';;
    esac
done