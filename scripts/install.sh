common_insatll() {
    :
}

mac_install () {
    # file manager
    brew install ranger 

    # audio tools
    brew install ffmpeg
    brew install sox

    # fzf
    brew install fzf
    $(brew --prefix)/opt/fzf/install
}

linux_install () {
    # file manager
    apt install ranger

    # fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}


common_install

if test "$(uname)" = "Darwin"
then
	mac_install
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
	linux_install
fi
