# install zplug, plugin manager for zsh, https://github.com/zplug/zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# zplug configruation
if [[ -d ~/.zplug ]]; then
	# proxy start
    export ZPLUG_HOME=~/.zplug
    if [[ -d "${ZPLUG_HOME}" ]]; then
      source "${ZPLUG_HOME}/init.zsh"
    fi
    zplug 'plugins/git', from:oh-my-zsh, if:'which git'
    zplug 'romkatv/powerlevel10k', as:theme, depth:1
    [[ ! -f ~/.dotfiles/zsh/.p10k.sh ]] || source ~/.dotfiles/zsh/.p10k.sh
	
    zplug 'zsh-users/zsh-autosuggestions'
    zplug 'zsh-users/zsh-completions', defer:2
    zplug 'zsh-users/zsh-history-substring-search'
    zplug 'zsh-users/zsh-syntax-highlighting', defer:2
    zplug "plugins/vi-mode", from:oh-my-zsh
    # zplug "jeffreytse/zsh-vi-mode"
    
    if ! zplug check; then
      zplug install
    fi
    
    zplug load
    
fi
