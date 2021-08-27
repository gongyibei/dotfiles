common_insatll() {
    :
}

mac_install () {
    # file manager
    brew install ranger 

    # audio tools
    brew install ffmpeg
    brew install sox
}

linux_install () {
    :
}


common_install

if test "$(uname)" = "Darwin"
then
	mac_install
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
	linux_install
fi

