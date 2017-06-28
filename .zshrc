autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
prompt walters

# aliases
if [[ $TERM=rxvt-unicode-256color ]]; then
    nv="nvim -u $HOME/.config/nvim/init.vim"
    # nv="nvim -u /home/thf/.config/nvim/init.vim"
elif [[ $TERM=linux ]]; then
    nv="nvim"
fi

source /etc/profile.d/autojump.zsh

# alias ev="$nv /home/thf/.config/nvim/init.vim"
# alias ez="$nv /home/thf/.zshrc"
# alias swc='$nv /home/thf/.config/sway/config'
alias ...='cd ../..'
alias ..='cd ..'
alias R='R --quiet'
alias bou='cd ~/bookshelf/study_notes/Bourbaki'
alias ev="$nv $HOME/.config/nvim/init.vim"
alias exz='exec zsh'
alias ez="$nv $HOME/.zshrc"
alias l='ls -la --color'
alias lM='ls -Am'
alias ld='ls -ld *(/)'
alias lm='ls -m --color'
alias lock='i3lock -u --color=000000'
alias misc='cd ~/bookshelf/study_notes/misc'
alias n="$nv"
alias pal='ping -c1 archlinux.org'
alias pau='sudo pacman -Syu'
alias psql='psql -h /tmp'
alias refact='nvim -c ":1d" -c ":%s/\(\d\)\@<=\spages\?//" -c ":%s/created on //" -c ":%s/scheduled for //" -c ":%s/\(\d\)\@<=\sdays\?//" -c ":wq"'
alias skl='~/.config/nvim/skel'
alias su='su -l'
alias swc="$nv $HOME/.config/sway/config"
alias sz='source ~/.zshrc'
alias xoff='sudo /opt/lampp/lampp stop'
alias xon='sudo /opt/lampp/lampp start'
alias pipall='sudo sudo sudo sudo sudo sudo sudo sudo pip freeze --local | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U'


bindkey -v 
bindkey "^j" "down-line-or-history"
bindkey "^k" "up-line-or-history"
bindkey "^l" "clear-screen"
bindkey "^a" "vi-beginning-of-line"
bindkey "^e" "vi-end-of-line"
bindkey "^r" "history-incremental-search-backward"

export XDG_CONFIG_HOME='$HOME/.config'
# export XDG_CONFIG_HOME='/home/thf/.config'
export HISTFILE='$HOME/.zsh_hist'
export HISTSIZE=10000
export SAVEHIST=2000
export PGDATA='/var/lib/postgres/data'
export ZDOTDIR='/home/thf'


setopt append_history
setopt hist_ignore_dups
setopt hist_no_functions



source  $HOME/dot_files/thf_functions.zsh
# source  /home/thf/dot_files/thf_functions.zsh
source $HOME/.zprofile
# source /home/thf/.zprofile
source /usr/bin/aws_zsh_completer.sh

eval "$(dircolors /etc/DIR_COLORS)"
export PS1=${PS1/\@\%U\%m\%u/}


echo "$HOME/.zshrc has been sourced."
