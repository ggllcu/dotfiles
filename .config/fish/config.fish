set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH
set -gx PATH /opt/homebrew/bin $PATH

source ~/.asdf/asdf.fish

starship init fish | source
zoxide init fish | source
fzf --fish | source

pyenv init - | source

# provides the ability to change the current working directory when exiting Yazi.
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
