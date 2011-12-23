### autoload ###
setopt extended_glob
setopt prompt_subst
autoload -U add-zsh-hook
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# autoload zeesh funcs
fpath=( ~/.zsh/func $fpath )
autoload -U ~/.zsh/func/*(:t)

### zsh opt ###
setopt auto_name_dirs
setopt ignore_eof
setopt always_to_end
setopt auto_param_slash
setopt no_single_line_zle
setopt multios
setopt cdablevarS
setopt noflowcontrol

### navigation ###
setopt auto_cd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home

### completion ###
#unsetopt noautomenu
setopt complete_in_word
setopt correct

### history ###
#setopt no_bang_hist
#setopt hist_verify
setopt hist_ignore_dups
setopt hist_ignore_alldups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
#setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_beep
HISTFILE=~/.zsh/local/history
HISTSIZE=10000
SAVEHIST=10000

### exports ###
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH=~/.dotfiles/scripts:~/.bin:$PATH
export PAGER=vimpager
export EDITOR=vim

### aliases ###
alias vim='vim -p'
alias vi=vim
alias vm=vim
alias o=_ogrep
alias cdsrc=cd_src_dir
alias cd/='cd /'
alias lsa='ls -lah'
# alias l='ls -la'
alias ll='ls -l'
alias d='dirs -lv'
alias r='pushd +1'
alias fd='cd ~-'
alias pd=zeesh_pushd_jump_to
alias pu='pushd'
alias po='popd'
alias md='mkdir -p'
mkcd(){ mkdir -p $1; cd $1 }
alias rd='rmdir -p'
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias figee=fg
alias figs=jobs
alias grep=zeesh_grep
alias g=grep
alias gr=zeesh_grep_recursive
alias fr=zeesh_find_replace_recursive
alias remove_recursive=zeesh_find_remove_recursive
alias lsg=zeesh_lsgrep
alias psg=zeesh_psgrep
alias pk=zeesh_pkill
#alias wget='noglob wget --no-check-certificate'
calc() { python -c "print $@" }
alias calc='noglob calc'
alias upgrade=zeesh_upgrade
alias plugin=zeesh_plugin
alias help='zeesh help'
alias reload='zeesh reload'
alias tips='zeesh tips'
alias zip='zip -r -9'
alias redo=zeesh_redo_as_sudo
alias scp='scp -C'
alias rscp='rsync --partial --progress --rsh=ssh'
alias ssh_proxy='ssh -C2qTnN -D 9999'
alias wc_recursive=zeesh_recursive_line_count
alias prefs=zeesh_prefs
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias dfu='df-up'
alias dfp='df-push'
alias dfs='df-status'

# rlwrap aliases
alias nc='rlwrap nc'
alias csi='rlwrap csi'
alias racket='rlwrap racket'
alias clj='rlwrap clj'

## keybindings ###
bindkey "^J" self-insert
# Delete bitches
bindkey "\e[3~" delete-char
# Home / End
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
# Home / End
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line

# PageUp / PageDown
# bindkey '\e[5~' beginning-of-history
# bindkey '\e[6~' end-of-history

# Up Arrow / Down Arrow
#bindkey '^[[5~' up-line-or-history
#bindkey '^[[6~' down-line-or-history
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
# History expansion on space
bindkey ' ' magic-space
# Shift+Tab reverse through menu completions
bindkey '^[[Z' reverse-menu-complete
# History search bound to Ctrl-R
bindkey '^R' history-incremental-search-backward
# On an empty command line runs bg (so that Ctrl+Z Ctrl+Z suspends a program
# and immediately resumes it in the background).
# On a non-empty command line, suspend the current command edition:
# let me type another command, and when that second command line finished, I get back the first command to edit.
_zeesh_fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    echo ''
    bg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N _zeesh_fancy-ctrl-z
bindkey '^Z' _zeesh_fancy-ctrl-z
# Ctrl-L pipes to less
bindkey -s '^L' '|less\n'
# Ctrl+Q to quote line
bindkey '^Q' quote-line
# Ctrl-N redirect to /dev/null
bindkey -s '^N' '> /dev/null 2>&1\n'

### default prompt ###
# setup prompt
PS1='%n@%m:${PWD/$HOME/~}%# '

### zsh plugins ###
# enable plugins
zeesh_enable_plugins
