#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Starting setup"
# Step 1: Update the OS

echo "Installing homebrew, then various dependencies for engineering."

# Install Xcode command line tools
xcode-select --install

# Install Rosetta
# Enables intel apps on apple silicon.
# softwareupdate --install-rosetta


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/chrisbuonocore/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install BE requirements
brew install jq
brew install docker
brew install awscli

# Python (for AWS tooling + ML)
brew install python
brew install pyenv
brew install jupyterlab

# Front end
brew install yarn

# Vscode
brew install --cask visual-studio-code

# Git
brew install git
brew install git-extras
brew install tree


# Go
brew install go

# zsh
brew install zsh
#ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Misc
brew install gcc
brew install tfenv
brew install httpie
brew install fzf
brew install vim

# Cleanup
brew cleanup

# pip
python -m ensurepip --upgrade
pip install -U scipy numpy matplotlib pandas scikit-learn

# Exports
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
