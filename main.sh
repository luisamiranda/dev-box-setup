#!/usr/bin/env zsh

install_homebrew() {
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew is installed."
    else
    	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_brew_cask() {
    local cask_name="$1"
    shift

    if brew list --cask "$cask_name" >/dev/null 2>&1; then
        echo "$cask_name is already installed."
        return
    fi

    for app_path in "$@"; do
        if [[ -e "$app_path" ]]; then
            echo "$app_path already exists. Skipping $cask_name."
            return
        fi
    done

    echo "installing $cask_name..."
    brew install --cask "$cask_name"
}

install_brew_casks() {
	brew update
    install_brew_cask docker "/Applications/Docker.app"
    install_brew_cask iterm2 "/Applications/iTerm.app"
    install_brew_cask visual-studio-code "/Applications/Visual Studio Code.app"
    install_brew_cask font-monoid-nerd-font "$HOME/Library/Fonts/Monoid Nerd Font Complete Mono.ttf" "$HOME/Library/Fonts/Monoid Nerd Font Complete.ttf"
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
    local script_dir="${0:A:h}"
    local zsh_custom_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    cp "$script_dir/configs/.zshrc" ~/.zshrc
    if [[ -d "$ZSH" ]]; then
        echo "Oh My Zsh is already installed."
    else
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    mkdir -p "$zsh_custom_dir/themes"
    cp "$script_dir/configs/bullet-train.zsh-theme" "$zsh_custom_dir/themes/bullet-train.zsh-theme"
    echo "Oh My Zsh is installed."
    source ~/.zshrc
}

install_fonts(){
    local script_dir="${0:A:h}"
    local fonts_dir="$HOME/Library/Fonts"

    mkdir -p "$fonts_dir"

    if [[ ! -e "$fonts_dir/Monoid-Regular.ttf" ]]; then
        cp "$script_dir/fonts/Monoid"/*.ttf "$fonts_dir/"
    fi
    if [[ ! -e "$fonts_dir/FiraCodeiScript-Regular.ttf" ]]; then
        cp "$script_dir/fonts/FiraCodeiScript-master"/*.ttf "$fonts_dir/"
    fi
    echo "Fonts are installed."
}

if [[ "${(%):-%N}" == "$0" ]]; then
	install_homebrew
	install_brew_casks
	install_brew_packages
	install_ohmyzsh
    install_fonts
fi

