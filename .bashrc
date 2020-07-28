if [ -n "$TMUX" ]; 
then
  echo "In Tmux"
else    
  echo "Not In Tmux"
fi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

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
export PS1="\e[38;5;87m\w\e[m \e[38;5;9m\$(parse_git_branch)\e[38;5;15m\$(parse_git_dirty)\e[38;5;256m➜\e[38;5;47m "
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

ORG="https://paymerang.visualstudio.com"
[ -f ~/alacritty/extra/completions/alacritty.bash ] && source ~/alacritty/extra/completions/alacritty.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/serverless.bash ] && . /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/sls.bash ] && . /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/slss.bash ] && . /Users/johncho/Workspace/pmg.b2b.sdk.authorizer/node_modules/tabtab/.completions/slss.bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
