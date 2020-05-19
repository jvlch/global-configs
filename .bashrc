if [ -n "$TMUX" ]; 
then
  echo "In Tmux"
else    
  echo "Not In Tmux"
fi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export PATH="$HOME/.cargo/bin:$PATH"
export TERM="screen-256color"
export PATH=/Users/johncho/Workspace/infracli:$PATH
export PS1="\[\033[38;5;10m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\]>>\[$(tput sgr0)\] \[$(tput sgr0)\]"

#source /Users/johncho/alacritty/extra/completions/alacritty.bash

alias tmux='tmux -2'
alias ~="cd ~"
alias c='clear'
alias r="cd$1 && tree -f -p -L 2 --filelimit=50"
alias ll='ls -FGlAhp'
alias l="echo $'-------------------------\n/\n/\n/\n------------------------\n'"
alias wp='cd ~/Workspace && ll'
alias vim='nvim'

ORG="https://paymerang.visualstudio.com"
[ -f ~/alacritty/extra/completions/alacritty.bash ] && source ~/alacritty/extra/completions/alacritty.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
