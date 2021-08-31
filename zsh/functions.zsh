function playmidi {

    SOUNDFONT='/usr/local/share/fluid-synth/sf2/TimGM6mb.sf2'

    if [ -e "$SOUNDFONT" ]
    then 

        for i in "$@"
        do 
            if [ -e "$i" ]
            then
                (fluidsynth -i "$SOUNDFONT" "$i"  2>&1) >/dev/null
            else
                echo "[playmidi]: cannot find file at $i"   
                return 1
            fi  
        done 
    else
            echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
            return 1
    fi  
}

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

