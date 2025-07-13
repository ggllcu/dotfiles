set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH
set -gx PATH /opt/homebrew/bin $PATH

starship init fish | source
zoxide init fish | source
fzf --fish | source
pyenv init - | source
mise activate fish --shims | source
