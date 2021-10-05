# Git branch in prompt.
function parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
export PS1="[\D{%F %T}]-\[\033[1;35m\]\u\[\033[1;36m\] @ \[\033[35m\]\w\[\033[0m\]\[\033[0;31m\]\$(parse_git_branch)\[\033[1;32m\] $ "
bind "set completion-ignore-case on"
if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
fi
