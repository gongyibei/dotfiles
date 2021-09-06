#!/bin/bash
set -e

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

greeting(){
    setup_color
	printf "$GREEN"
	cat <<-'EOF'
         ____________________________________ 
        < You are using gongyibe's dotfiles! Have fun! >
         ------------------------------------ 
                \   ^__^
                 \  (oo)\_______
                    (__)\       )\/\
                        ||----w |
                        ||     ||
        
	EOF
	printf "$RESET"
}


cp_file_if_exists(){
    if [ -f "$1" -a -e $2 ];
    then
        cp "$1" "$2"
    fi
    
    echo $1
}

pre_set(){
    # get variables in mac or linux
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)
			if [ ! -d /usr/local/softwares/ ];then
				echo INFO:Creating directory in /usr/local/softwares/, may need sudo priviledge
				sudo mkdir -p /usr/local/softwares/
				sudo chmod 777 -R /usr/local/softwares/
			fi
            ;;
        Darwin*)
            mkdir -p ~/applications/ 
            ;;
        *)
            echo "System not supported, support [mac|linux], abort!"
            exit 0
    esac
}

check_project(){
    # initialization for the dotfiles project
    PROJECT_PATH=~/.dotfiles
    if [ ! -d "$PROJECT_PATH" ]; then
        git clone https://github.com/gongyibei/dotfiles  $PROJECT_PATH
        mkdir -p $PROJECT_PATH/downloads
    fi
    cd $PROJECT_PATH
}

dump_and_ln(){
    mv $2 $2.bak 
    ln -s $1 $2
}

setup_config(){
    # zshrc
    dump_and_ln ~/.dotfiles/zsh/zshrc.zsh ~/.zshrc

    # tmux 
    dump_and_ln ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

    # ranger
    dump_and_ln ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
    dump_and_ln ~/.dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf
    dump_and_ln ~/.dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

    # nim 
    dump_and_ln ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

	# sts zsh/.zsh_profile ~

    # nvim
    # mkdir -p ~/.config/nvim && cp neovim/init.vim ~/.config/nvim

	# # git
    # cp_file_if_exists git/.gitconfig ~
	# cp_file_if_exists git/.gitmessage ~
	# cp_file_if_exists git/.git-credentials ~

	# # ssh
	# cp_file_if_exists ssh/config ~/.ssh

	# # conda
	# cp_file_if_exists conda/.condarc ~
	# cp_file_if_exists -r .pip ~

    # # tmux
    # cp_file_if_exists tmux/.tmux.conf ~
}

main(){
    greeting
    pre_set
    check_project
    setup_config
}

main
