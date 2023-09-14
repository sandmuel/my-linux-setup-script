echo "Do not proceed if you are logged in as root, some parts of the installation are dependent on your home directory."
echo "Authenticate to proceed, or press ctrl+c to quit."
sudo echo ""
clear
sude echo "Installation starting..."

############
# HOMEBREW #
############

sudo echo "Beginning Homebrew installation"
# run official homebrew install script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# make brew useable
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
# notify the user of completion
echo "Homebrew is now installed and ready to use..."

#############################
# PREPARE FLATPAK FOR USAGE #
#############################

echo "Beginning Flatpak installation"
# install flatpak
sudo zypper install flatpak
# add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# notify the user of completion
echo "Flatpak is now installed and ready to use..."

###############################################
# REPLACE ZYPPER FIREFOX WITH FLATPAK FIREFOX #
###############################################

echo "Replacing firefox with a flatpak..."
# swap it out
sudo zypper remove remove firefox
flatpak install flathub org.mozilla.firefox
echo "Done!"

#################################################
# TO DO: ADD DEFAULT CONFIG FOR SWAY INTO $HOME #
#################################################


#####################
# ADD IN ESSENTIALS #
#####################

# neovim, nvchad, git, neofetch
