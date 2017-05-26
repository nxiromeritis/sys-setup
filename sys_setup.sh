#!/bin/bash

echo "Ubuntu 16.04 LTS system configuration script."


# verify that the computer is running a Debian derivative
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
if ! command -v dpkg &> /dev/null; then
    echo "this script is meant to be run on an Ubuntu system"
    exit 1
fi


# store the username
SCRIPT_USER=$USER


# option to run apt-get update and apt-get upgrade
update_and_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade
}


while true; do
    read -e -p "Do you want to apt-get update and upgrade the system? (y/n): " UPDATE_AND_UPGRADE_ANSWER
    case $UPDATE_AND_UPGRADE_ANSWER in
        [Yy]* )
            update_and_upgrade
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "please enter \"y\" for yes or \"n\" for no"
            ;;
    esac
done


cd $HOME

# install git
sudo apt-get install -y git

# install vim
sudo apt-get install -y vim


# vim backup
if [ -d .vim]; then
    mv -iv .vim .vim.backup
fi

# my .vimrc
rm -f .vimrc
mv -iv ./sys-setup/vim_setup/.vimrc .

# setup Vundle
# https://github.com/gmarik/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install configured bundles
vim +PluginInstall +qall
# /Vim


# install valgrind, gdb, ddd
sudo apt-get install -y valgrind
sudo apt-get install -y gdb
sudo apt-get install -y ddd

# install ssh, scp, wireshark
sudo apt-get install -y ssh
sudo apt-get install -y openssh-client
sudo apt-get install -y wireshark

# install curl
sudo apt-get install -y curl

# install tree
sudo apt-get install -y tree

#install xclip
sudo apt-get install -y xclip

#install htop
sudo apt-get install -y htop

#install screenfetch
sudo apt-get install -y screenfetch

#install tmux
sudo apt-get install -y tmux


# install additional posix man pages
sudo apt-get install -y manpages-posix manpages-posix-dev

# install unity-tweak-tool
sudo apt-get install -y unity-tweak-tool

# install dconf-tools
sudo apt-get install -y dconf-tools

# install colordiff
sudo apt-get install -y colordiff

### bash configurations
mv -iv .bashrc .bashrc.old
mv -iv ./sys-setup/bash_setup/.bashrc .
mv -iv ./sys-setup/bash_setup/.bash_aliases .


echo "Almost done."

while true; do
    read -e -p "Do you want to apt-get update and upgrade the system? (y/n): " UPDATE_AND_UPGRADE_ANSWER
    case $UPDATE_AND_UPGRADE_ANSWER in
        [Yy]* )
            update_and_upgrade
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "please enter \"y\" for yes or \"n\" for no"
            ;;
    esac
done

# install anaconda
# create 3.5 environment
echo "Configuration done."
echo "Make sure to download and install anaconda and create python environments with:"
echo "sudo bash <installation-script>"
echo "conda create -n pyxx python=x.x anaconda"

# configure git
echo "Make sure to configure git: "
echo "git config --global user.name \"<name>\""
echo "git config --global user.email <email>"
echo "git config --global core.editor vim"
