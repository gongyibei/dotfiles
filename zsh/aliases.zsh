common_aliases () {
    # dotfiles
    alias cdd='cd ~/.dotfiles/'

    # blog
    alias wb='cd ~/blog/source/_posts/;nvim .'
    alias db='cd ~/blog/source/_posts/; ./cp_img.sh; cd ~/blog; hexo g; hexo d;cd -'
    alias nb='cd ~/blog; hexo n'

    # nvim 
    alias vi='nvim'
    alias vim='nvim'
    #alias dn='cd ~/.config/nvim/;git ? ;cd -'
    alias cdn='cd ~/.config/nvim/'
    alias en='nvim ~/.config/nvim/init.vim'
    alias dn='cd ~/.config/nvim/;git add .;git commit -m "...";git push origin master'

    # ranger 
    alias fm='ranger'
    alias er='nvim ~/.config/ranger/rc.conf'
    alias cdr='cd ~/.config/ranger '

    # .zshrc
    alias ez='ranger ~/.dotfiles/zsh/'
    alias sz='source ~/.zshrc'

    # leetcode
    alias lgp='leetcode show -gex -l python3'
    alias lgg='leetcode show -gex -l golang'
    alias cdl='~/Project/leetcode/'

    # pytora
    alias typora="open -a typora"

    # using go in jupyter
    # alias jupyter-go-up='cd ~/Project/github/lgo/docker/jupyter/; ./up.sh; cd -'
    # alias jupyter-go-down='cd ~/Project/github/lgo/docker/jupyter/; ./down.sh; cd -'

    # connect to windows
    alias rd1='rdesktop -f -u Administrator -p 123456 10.22.76.49'

    # other
    alias cman='man -M /usr/local/share/man/zh_CN'
    alias cnt='ls -lR| grep "^-" | wc -l'
    # alias cat="highlight $1 --out-format xterm256 -l --force -s pablo --no-trailing-nl"
    alias ss="export http_proxy=127.0.0.1:1087 https_proxy=127.0.0.1:1087"
    alias uss="unset http_proxy https_proxy"
    alias downgit="curl https://raw.githubusercontent.com/${0}" 

    # thefuck
    eval $(thefuck --alias)
}

mac_aliases () {
    :
}

linux_aliases () {
    :
}


common_aliases

if test "$(uname)" = "Darwin"
then
	mac_aliases
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
	linux_aliases
fi

