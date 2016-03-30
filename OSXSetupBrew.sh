#!/bin/sh

#Install HomeBrew & cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install binaries
binaries=(
	caskroom/cask/brew-cask
	argon/mas/mas
	tree
	nodebrew
)
echo "installing binaries..."
brew install ${binaries[@]}


# Install node stable binary
nodebrew install-binary stable
nodebrew use stable


#Symlink into the normal place. Add this to login scripts as well
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap rcmdnk/file
brew install brew-file
brew tap caskroom/homebrew-versions

apps=(
	versions
	sequel-pro
	sublime-text3
	macdown
	iterm2
	google-chrome
	alfred
	vlc
	kaleidoscope
	onyx
	teamviewer
	visual-studio-code
	atom
	qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
	1password
	google-japanese-ime
	# mamp
	# launchcontrol
	# dropbox
	# wakeonlan
)

echo "installing apps..."
brew install ${apps[@]}


# Apple store apps installing
appleapps=(
 497799835 # Xcode
 449589707 # Dash
 433335799 # CodeRunner
)

echo "installing appleapps..."
mas install ${appleapps[@]}

