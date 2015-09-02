#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# User configuration

# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# enable colored output from ls, etc
export CLICOLOR=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory         # where to store zsh config
HISTSIZE=1024
SAVEHIST=1024
setopt bang_hist                # !keyword
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands

export MANPATH="/usr/local/man:$MANPATH"

. ~/bin/z/z.sh

export LSCOLORS=ExFxCxDxBxegedabagacad
setopt NO_BEEP

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


source ~/.aliases

autoload -Uz promptinit
promptinit
prompt cendaeg ❮
