# zsh options
setopt extended_glob       \
       auto_name_dirs      \
       ignore_eof          \
       always_to_end       \
       auto_param_slash    \
       no_single_line_zle  \
       multios             \
       cdablevarS          \
       noflowcontrol       \
       auto_cd             \
       pushd_ignore_dups   \
       pushd_silent        \
       pushd_to_home       \
       complete_in_word    \
       correct             \
       hist_ignore_dups    \
       hist_ignore_alldups \
       hist_ignore_space   \
       hist_reduce_blanks  \
       hist_no_store       \
       extended_history    \
       inc_append_history  \
       hist_beep

# history
HISTFILE=~/.zsh/local/history
HISTSIZE=10000
SAVEHIST=10000

# 100ms timeout for key sequences (defaults to 400ms)
KEYTIMEOUT=10

# exports
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH=~/.bin:~/.ellipsis/bin:$PATH
export RSYNC_RSH=ssh

# aliases
alias l=ls
alias d='dirs -lv'
alias cd/='cd /'
alias .='cd ~-'
alias r='pushd +1'
alias pd='pushd'
alias po='popd'
alias md=take
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias rmf='rm -rf'
alias grep='grep -i --color=auto'
alias g=grep
alias frp=find-replace-recursive
alias zip='zip -r -9'
alias scp='scp -C'
alias rscp='rsync --partial --progress --rsh=ssh'
alias ssh-proxy='ssh -C2qTnN -D 9999'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias nc='rlwrap nc'
alias curl='noglob curl'
alias diff='git diff --color=never --no-index'
alias ag="ag -S --color-match='30;31' --color-line-number='31;35' --color-path='31;34'"

# zeesh aliases
alias help='zeesh help'
alias plugin=zeesh-plugin
alias prefs=zeesh-prefs
alias tips='zeesh tips'
alias upgrade=zeesh-upgrade
alias vcs='zeesh-plugin-enable vcs-info'

## keybindings
bindkey "^J" self-insert
bindkey "\e[3~" delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey ' ' magic-space
bindkey '^[[Z' reverse-menu-complete
bindkey '^R' history-incremental-search-backward
bindkey -s '^L' "|$PAGER"
bindkey '^Q' quote-line
bindkey -s '^N' '> /dev/null 2>&1\n'
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# default prompt
PS1='%n@%m:${PWD/$HOME/~}%# '


# load funcs
fpath=( ~/.zsh/func $fpath )
autoload -U ~/.zsh/func/*(:t)

# can't live without
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# enable plugins
zeesh-plugin-enable

# vim: ft=zsh
