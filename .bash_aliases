
#git alias
alias gst='git status'
alias gs='git status'
alias gsh='git show'
alias glog='git log --oneline'
alias gl='git log --oneline -n 8'
alias gl2='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias glo='git log --oneline -n 15'
alias gal='gl; gst'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gbr='git branch'
alias gfa='git fetch --all'
alias ga='git add'
alias gp='git pull'
alias gb='git branch'
alias gd='git diff'
alias gdc='git diff --cached'
alias grg='git reset --hard'
alias grv='git remote -v'
alias grhh='git reset --hard HEAD'
alias gs='git show'
alias gca='git commit --amend'
alias gpr='git pull --rebase'
alias gcane='git commit --amend --no-edit'
alias gitlog="git log --graph --date=short --format=format:'%w(200,0,4)%C(yellow)%ad %Cblue%aN%Creset: %Cgreen%h%Creset %C(magenta)%d%Creset %s' $@ && echo \"\""
alias glg="gitlog"
alias g_clean_local="git branch --merged master | grep  --invert-match ".*master" | xargs -n 1 git branch --delete"
