if [ -n "$TMUX" ]; 
then
  echo "In Tmux"
else    
  echo "Not In Tmux"
fi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export HISTCONTROL=ignoredups
export PATH="$HOME/Workspace/adminscripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export TERM="screen-256color"
export PATH=/Users/johncho/Workspace/infracli:$PATH
export PATH=/Users/johncho/.npm-global/bin:$PATH
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf "["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf ">"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf "!"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf "+"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf "?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf "*"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf "-"; else printf ""; fi
  printf "]"
}
export PS1="\[\e[38;5;87m\]\w\[\e[m\] \[\e[38;5;9m\]\$(parse_git_branch)\[\e[38;5;15m\]\$(parse_git_dirty)\[\e[38;5;256m\]➜\[\e[38;5;47m\] "
trap 'echo -ne "\e[38;5;15m" ' DEBUG

#source /Users/johncho/alacritty/extra/completions/alacritty.bash

alias tmux='tmux -2'
alias ~="cd ~"
alias c='clear'
alias r="cd$1 && tree -f -p -L 2 --filelimit=50"
alias ll='ls -FGlAhp'
alias l="echo $'-------------------------\n/\n/\n/\n------------------------\n'"
alias wp='cd ~/Workspace && ll'
alias vim='nvim'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias cdd='thediriwanttogoto=$(ls -d ~/Workspace/* | fzf) && cd $thediriwanttogoto'
alias gspr='git fetch && git stash && git pull --rebase && git stash pop'
alias gpr='git fetch && git pull --rebase'
alias gbr='git branch | fzf -d 15'
gch() {
 git checkout "$(git branch | fzf | tr -d '[:space:]')"
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
_viewGitLogLineUnfancy="$_gitLogLineToHash | xargs -I % sh -c 'git show %'"

# gls - git commit browser with previews and vim integration 
gls() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, ctrl-y to copy hash, ctrl-o to open in vim" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "CTRL-o:execute:$_viewGitLogLineUnfancy | vim -" \
                --bind "CTRL-y:execute:$_gitLogLineToHash | pbcopy"
}

ORG="https://paymerang.visualstudio.com"
[ -f ~/alacritty/extra/completions/alacritty.bash ] && source ~/alacritty/extra/completions/alacritty.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
