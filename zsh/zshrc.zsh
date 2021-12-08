# oh-my-zsh 
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# 环境变量
source ~/.dotfiles/zsh/exports.zsh

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# dotbare
source ~/.dotbare/dotbare.plugin.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
