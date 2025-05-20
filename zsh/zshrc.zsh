# oh-my-zsh 
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# 环境变量
source ~/.dotfiles/zsh/exports.zsh

# boot up x-cmd.
[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X"

# 插件
source ~/.dotfiles/zsh/zplug.zsh

# 别名
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/aliases.zsh

# 杂项
source ~/.dotfiles/zsh/misc.zsh

# conda
source ~/.dotfiles/zsh/.conda.zsh

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)


# dotbare
# source ~/.dotbare/dotbare.plugin.zsh

# autojump
[[ -s /home/gyk/.autojump/etc/profile.d/autojump.sh ]] && source /home/gyk/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

. ~/.dotfiles/zsh/z.sh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
