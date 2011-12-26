### zsh-syntax-highlighting / zeesh! plugin

[ -d "$PLUGIN_DIR/lib" ] || source "$PLUGIN_DIR/install"

source "$PLUGIN_DIR/lib/zsh-syntax-highlighting.zsh" >/dev/null 2>&1

# manually enable highlighters because _zsh_highlight_load_highlighters() is problematic
typeset -gA ZSH_HIGHLIGHT_STYLES

HIGHLIGHTERS_DIR="$PLUGIN_DIR/lib/highlighters/"
for DIR ($HIGHLIGHTERS_DIR/*/); do
    NAME="${DIR:t}"
    source $DIR/$NAME-highlighter.zsh
done
unset DIR NAME

# override some styles
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=red,bold,standout'
ZSH_HIGHLIGHT_STYLES[path]='none'
# ZSH_HIGHLIGHT_STYLES[globbing]='fg=white,bold'
# ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=red,bold'
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta,bold'
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan,bold'
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'
