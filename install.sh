echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install
softwareupdate --install-rosetta

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git and wget..."
brew install git
brew install wget


echo "Git config"

git config --global user.name "Michael Folino"
git config --global user.email mvfolino68@gmail.com
git lfs install

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

# Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install oh my zsh theme and update config
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Installing Applications"
# Install font
brew tap homebrew/cask-fonts
brew install --cask homebrew/cask-fonts/font-meslo-lg-nerd-font
cd ~/Library/Fonts && { 
    curl -O 'https://github.com/Falkor/dotfiles/blob/master/fonts/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf'
    cd -; }

brew install --cask alfred
brew install --cask google-drive
brew install --cask notion
brew install --cask rectangle
brew install --cask
brew install --cask zoomus
brew install docker
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask spotify
brew install --cask visual-studio-code
brew install mackup
brew install terraform
brew install mas
brew install awscli



brew cask cleanup
brew cleanup

mas install 1440147259  
# AdGuard for Safari
mas install 1295203466  
# Microsoft Remote Desktop
mas install 1459809092  
# Accelerate
mas install 442160987   
# Flycut
mas install 1472777122  
# PayPal Honey
mas install 462058435   
# Microsoft Excel
mas install 1592541616  
# FakespotSafari
mas install 963034692   
# Streaks
mas install 414781829   
# Keeper Password Manager
mas install 409201541   
# Pages
mas install 462054704   
# Microsoft Word
mas install 1451893560  
# Rakuten Cash Back
mas install 1462114288  
# Grammarly for Safari

# Install confluent
curl -sL --http1.1 https://cnfl.io/cli | sh -s -- latest
export PATH=$(pwd)/bin:$PATH

########################### Mackup ###########################
echo "Mackup begin"
echo "[storage]
engine = icloud" >> ~/.mackup.cfg
mackup restore

########################### Begin System Default Updates ###########################
echo "Begin System Default Updates..."
#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36
