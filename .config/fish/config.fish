set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH
set -gx PATH /opt/homebrew/bin $PATH

source ~/.asdf/asdf.fish

starship init fish | source
zoxide init fish | source
fzf --fish | source
