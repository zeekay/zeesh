# zeesh zsh autocomplete plugin

# add zeesh comps to $fpath
fpath=( ~/.zsh/comp $fpath )

#autoload -U ~/.zsh/comp/*(:t)
autoload -U compinit; compinit

zmodload -i zsh/complist

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# hide shit
zstyle ':completion:*:complete:-command-:*' ignored-patterns '*.dll' \
       '*.tlb' 'aclocal*' '*.exe' '*.com' 'deb*' 'dec*' 'de-*' '*cpl' 'D*' \
       'dev*' 'activate_this.py' 'hg-diff3-merge' 'HG_LOGIN_INFO' 'HG_REMOTE_PATH' \
       'histchars' 'HISTCHARS' 'HISTFILE' 'historywords' 'HISTSIZE' \
       'PYTHONSTARTUP' 'VENDOR' '_*'
zstyle ':completion:*:(all-|)files' ignored-patterns '_*' 'zeesh_*'
zstyle ':completion:*:*:open:*' matcher 'm:{a-z}={A-Z} r: ||[^ ]=**'

# case-insensitive (all), partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ]; then
  zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
  zstyle ':completion:*:*:(ping|telnet|dig|ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

# comp options verbose info/errors
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# rationalize dot
#zle -N _rationalize_dot
#bindkey . _rationalize_dot

# zshfu plugin list autocomplete
compctl -K zeesh_plugin_list zeesh_plugin
