# function playmidi {

#     SOUNDFONT='/home/gyk/.dotfiles/fluidsynth/TimGM6mb-MuseScore.sf2'

#     if [ -e "$SOUNDFONT" ]
#     then 

#         for i in "$@"
#         do 
#             if [ -e "$i" ]
#             then
#                 (fluidsynth -a alsa -i "$SOUNDFONT" "$i"  2>&1) >/dev/null
#             else
#                 echo "[playmidi]: cannot find file at $i"   
#                 return 1
#             fi  
#         done 
#     else
#             echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
#             return 1
#     fi  
# }

function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
function ranger-cd() {
	tempfile=$(mktemp)
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
    cd -- "$(cat "$tempfile")"
	fi
    rm -f -- "$tempfile"
	# hacky way of transferring over previous command and updating the screen
	# VISUAL=true zle edit-command-line
}
# zle -N ranger-cd
alias fc='ranger-cd'
bindkey '^o' ranger-cd

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
	tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)

fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

gpus() {
    nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv | sed -n '2,$p'
}

gpu1() {
    nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv | sed -n '2,2p'
}

gpu2() {
    nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv | sed -n '3,3p'
}

jj() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

