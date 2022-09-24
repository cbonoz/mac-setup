#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Starting setup"
# Step 1: Update the OS

echo "Installing homebrew, then various dependencies for Engineering."

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Python (for AWS tooling + ML)
brew install python
brew install python3

brew install git
brew install git-extras
brew install tree

brew install zsh

# Install BE requirements
brew install jq
brew install docker
brew install awscli

brew install gcc
brew install maven@3.5
echo 'export PATH="/usr/local/opt/maven@3.5/bin:$PATH"' >> ~/.zshrc

brew install tfenv
tfenv install 0.11.7

brew install httpie
brew install fzf

brew install vim

brew cleanup
