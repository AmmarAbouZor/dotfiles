# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
EDITOR="nvim"
export EDITOR
VISUAL="nvim"
export VISUAL
AOC_TEST_PATH="/home/ammar/Desktop/test_proj"
export AOC_TEST_PATH
HELIX_RUNTIME=~/repos/helix/runtime
export HELIX_RUNTIME

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# My aliases
alias adv="cd ~/Desktop/advent_of_code/ ; hx ."
alias upup="sudo dnf update"
alias la="ls -a"

unset rc
. "$HOME/.cargo/env"
