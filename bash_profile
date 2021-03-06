#!/usr/bin/env bash

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$HOME/go/bin:$HOME/.rvm/bin:$HOME/.npm-packages/bin:$HOME/.bash/bin:$PATH:$HOME/.cargo/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export TERM="xterm-256color"

# Set my editor and git editor
export EDITOR="vim"

export GEM_EDITOR="subl"
export BUNDLER_EDITOR="subl"
export BUNDLE_JOBS=8

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# history handling
export HISTCONTROL='ignoreboth'
export HISTSIZE=500000
export HISTFILESIZE="${HISTSIZE}"
export AUTOFEATURE=true autotest

# Identify OS and Machine
export OS=`uname -s | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/ *//g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"

# Disabling Analytics for homebrew
export HOMEBREW_NO_ANALYTICS=1

# Disabling some shell-check errors
export SHELLCHECK_OPTS="-e SC1090"

# Adding Support for other OSes
export PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && export PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && export PREVIEW="/Applications/Preview.app"

# Path to the bash it configuration
export BASH="$HOME/.bash"

# Load Bash It
source "$BASH"/bash_it.sh

eval "$(direnv hook bash)"

# Don't check mail when opening terminal.
unset MAILCHECK

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# append to bash_history if Terminal.app quits
shopt -s histappend

# TODO: move this to provistioning
# $ echo kern.maxfiles=65536 | sudo tee -a /etc/sysctl.conf
# $ echo kern.maxfilesperproc=65536 | sudo tee -a /etc/sysctl.conf
# $ sudo sysctl -w kern.maxfiles=65536
# $ sudo sysctl -w kern.maxfilesperproc=65536
# ulimit -n 65536 65536

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
