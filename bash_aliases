alias g='git '
alias got='git '
alias get='git '
alias ga='git add'
alias gs='git status '
alias gc='git commit '
alias gcm='git commit -a -m '
alias gb='git branch '
alias go='git checkout '
alias gf='git fetch '
alias gd='git diff '
alias gps='git push '
alias grb='git rebase '
alias gpl='git pull '
alias gm='git merge '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gd='git discard '
alias gda='git discardall'
alias gwin='git config --global credential.helper wincred'

# add autocompletion for aliases
__git_complete g _git
__git_complete ga _git_add
__git_complete gs _git_status
__git_complete gc _git_commit
__git_complete gcm _git_commit
__git_complete gb _git_branch
__git_complete go _git_checkout
__git_complete gf _git_fetch
__git_complete gd _git_diff
__git_complete gps _git_push
__git_complete gpl _git_pull
__git_complete gm _git_merge
