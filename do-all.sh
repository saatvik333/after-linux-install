#!/bin/bash

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

basic_update() {
    echo -e "${GREEN}Updating package repositories${NOCOLOR}"
    sudo apt-get update
}

install_utils() {
    echo -e "${GREEN}Installing basic utils :)${NOCOLOR}"
    sudo apt-get install -y curl wget htop apt-transport-https preload gpg build-essential
}

install_basic_apps() {
    echo -e "${GREEN}Installing basic applications :)${NOCOLOR}"
    sudo apt-get install -y git neofetch vlc vim audacity obs-studio gnome-tweaks ranger cmatrix
}

install_vscode() {
    echo -e "${GREEN}Installing VS Code :)${NOCOLOR}"
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt-get install -y code
}

install_nodejs() {
    echo -e "${GREEN}Installing NodeJS :)${NOCOLOR}"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
}

install_rust() {
    echo -e "${GREEN}Installing Rust :)${NOCOLOR}"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install_go() {
    echo -e "${GREEN}Installing Go:)${NOCOLOR}"
    GOTOOLS=$HOME/go/tools

    if [ ! -z "$1" ]; then
        GOTOOLS=$1
    fi

    mkdir -p $GOTOOLS
    DL_HOME=https://go.dev
    DL_PATH_URL="$(wget --no-check-certificate -qO- https://go.dev/dl/ | grep -oP '\/dl\/go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1)" 
    latest="$(echo $DL_PATH_URL | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2 )"

    echo "Downloading latest Go for AMD64: ${latest}"
    wget --no-check-certificate --continue --show-progress "$DL_HOME$DL_PATH_URL" -P $GOTOOLS
    unset DL_PATH_URL
    
    sudo tar -C /usr/local -xzf go"${latest}".linux-amd64.tar.gz
    echo "export PATH='$PATH':/usr/local/go/bin:$GOPATH/bin" >> ~/.profile && source ~/.profile
}

install_ohmybash() {
    echo -e "${GREEN}Installing Oh-My-Bash with rr theme :)${NOCOLOR}"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    sed 's/OSH_THEME="powerline"/OSH_THEME="rr"/g' ~/.bashrc
}

install_zsh_with_powerlevel10k() {
    echo -e "${GREEN}Installing ZSH with powerlevel10k theme :)${NOCOLOR}"
    sudo apt-get install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
}

final_cleanup() {
    echo -e "${GREEN}Final steps :)${NOCOLOR}"
    sudo apt-get update
    sudo apt-get autoclean
    sudo apt-get autoremove
}

run_selected_functions() {
    echo -e "${GREEN}Select the functions to run (comma-separated):${NOCOLOR}"
    echo -e "1. install_basic_apps: git neofetch vlc vim audacity obs-studio gnome-tweaks ranger cmatrix"
    echo -e "2. install_vscode"
    echo -e "3. install_nodejs"
    echo -e "4. install_rust"
    echo -e "5. install_go"
    echo -e "6. install_ohmybash"
    echo -e "7. install_zsh_with_powerlevel10k"
    echo -e "8. none"
    read -p "Enter your selection: " selection
    IFS=',' read -ra selected_functions <<< "$selection"

    for func in "${selected_functions[@]}"; do
        case $func in
            1) install_basic_apps ;;
            2) install_vscode ;;
            3) install_nodejs ;;
            4) install_rust ;;
            5) install_go ;;
            6) install_ohmybash ;;
            7) install_zsh_with_powerlevel10k ;;
            *) echo "Invalid selection: $func" ;;
        esac
    done
}

basic_update
install_utils
run_selected_functions
final_cleanup