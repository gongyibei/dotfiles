common_aliases () {
    # basic
    alias e='nvim'
    alias p='pager'

    # dotfiles
    alias cdd='cd ~/.dotfiles/'
    alias eb='ranger ~/.dotfiles/bin/'
    # alias ed='ranger ~/.dotfiles/'
    alias ed='dotbare fedit'

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

    # tytora
    alias typora="open -a typora"

    alias dh="df -hT |grep -vE 'loop|tmpfs'"

    # using go in jupyter
    # alias jupyter-go-up='cd ~/Project/github/lgo/docker/jupyter/; ./up.sh; cd -'
    # alias jupyter-go-down='cd ~/Project/github/lgo/docker/jupyter/; ./down.sh; cd -'

    # connect to windows
    alias rd1='rdesktop -f -u Administrator -p 123456 10.22.76.49'

    # fzf
    # unalias z 2> /dev/null
    # z() {
    # [ $# -gt 0 ] && _z "$*" && return
    # cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
    # }

    # other
    alias cman='man -M /usr/local/share/man/zh_CN'
    # alias cnt='ls -lR| grep "^-" | wc -l'
    # alias cat="highlight $1 --out-format xterm256 -l --force -s pablo --no-trailing-nl"
    # 127前面不要加 https://
    alias ss="export http_proxy=127.0.0.1:1087 https_proxy=127.0.0.1:1087"
    alias uss="unset http_proxy https_proxy"

    alias ss1="export http_proxy=127.0.0.1:2224 https_proxy=127.0.0.1:2224"

    alias downgit="curl https://raw.githubusercontent.com/${0}" 

    alias cntwav='ls -lR| grep "^-.*\.wav" | wc -l'

    alias cntfile='ls -l | grep "^-" | wc -l'
    alias cntfiles='ls -lR| grep "^-" | wc -l'
    alias cntdir='ls -l | grep "^d" | wc -l'
    alias cntdirs='ls -lR| grep "^d" | wc -l'
    alias calc='gcalccmd'

    # whale
    alias wh=~/.whale/bin/whale

    # xclip
    alias clip='xclip -selection c'

    

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

