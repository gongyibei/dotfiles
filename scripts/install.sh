common_insatll() {
    :
}

mac_install () {
    # zsh
    brew install zsh
    # oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # zplug https://github.com/zplug/zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

    # neovim
    brew install neovim
    # vim-plug https://github.com/junegunn/vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # file manager
    brew install ranger 

    # audio tools
    brew install ffmpeg
    brew install sox

    # fzf
    brew install fzf
    $(brew --prefix)/opt/fzf/install

    # privoxy
    brew install privoxy
}

linux_install () {
    # zsh
    brew install zsh
    # oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # zplug https://github.com/zplug/zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

    # neovim
    apt install neovim
    # https://github.com/junegunn/vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # file manager
    apt install ranger

    # fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # privoxy
    apt install privoxy

}


common_install

if test "$(uname)" = "Darwin"
then
	mac_install
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
	linux_install
fi
