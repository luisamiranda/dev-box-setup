#!/usr/bin/env bash

install_homebrew() {
    if (( $+commands[brew] )); then
        echo "Homebrew is installed."
    else
    	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_brew_casks() {
	brew update
    # Short single-line syntax using the '||' (OR) operator
    brew list --cask docker &>/dev/null || { 
        echo "installing docker..."
        brew install --cask docker
    }
    brew list --cask iterm2 &>/dev/null || { 
        echo "installing iterm2..."
        brew install --cask iterm2
    }
    brew list --cask visual-studio-code &>/dev/null || { 
        echo "installing visual-studio-code..."
        brew install --cask visual-studio-code
    }
    brew list --cask font-monoid-nerd-font &>/dev/null || { 
        echo "installing font-monoid-nerd-font..."
        brew install --cask font-monoid-nerd-font
    }
    echo "All casks are installed."
}

install_brew_packages() {
    brew update
    brew list git &>/dev/null || brew install git
    brew list gh &>/dev/null || brew install gh
    brew list node &>/dev/null || brew install node
    brew list thefuck &>/dev/null || brew install thefuck
    echo "All packages are installed."
}

install_ohmyzsh() {
    cp ./configs/.zshrc ~/.zshrc
    cp ./configs/bullet-train.zsh-theme $ZSH_CUSTOM/themes/bullet-train.zsh-theme
    if [[ -d "$ZSH" ]]; then
        echo "Oh My Zsh is already installed."
    else
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    echo "Oh My Zsh is installed."
    source ~/.zshrc
}

install_fonts(){
    if [[ ! -d "$HOME/Library/Fonts/Monoid" ]]; then
        cd ../Monoid
        cp *.ttf ~/Library/Fonts/
    fi
    if [[ ! -d "$HOME/Library/Fonts/FiraCodeiScript-master" ]]; then
        cd ../FiraCodeiScript-master
        cp *.ttf ~/Library/Fonts/
    fi
    echo "Fonts are installed."
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
	install_homebrew
	install_brew_casks
	install_brew_packages
	install_ohmyzsh
    install_fonts
fi

