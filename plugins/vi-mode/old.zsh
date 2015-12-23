# These are required for zsh < 5.0.8

# Delete from cursor position to end of word and stay in normal mode
zle-vicmd-de() {
    zle kill-word
}

# Delete from cursor position to end of word + surrounding whitespace and stay in normal mode
zle-vicmd-dw() {
    zle kill-word
    zle vi-delete-char
}

# Delete from cursor position to end of word and stay in normal mode
zle-vicmd-db() {
    zle vi-backward-kill-word
    zle vi-backward-delete-char
}

# Delete current word and stay in normal mode
zle-vicmd-diw() {
    zle kill-word
}

# Delete from current positon to end of word and change to insert mode
zle-vicmd-cw() {
    zle kill-word
    zle -K viins
}

# Delete current word and change to insert mode
zle-vicmd-ciw() {
    zle kill-word
    zle -K viins
}

# Delete current word and surrounding whitespace and change to insert mode
zle-vicmd-caw() {
    zle kill-word
    zle vi-delete-char
    zle -K viins
}

zle -N zle-vicmd-caw
zle -N zle-vicmd-ciw
zle -N zle-vicmd-cw
zle -N zle-vicmd-db
zle -N zle-vicmd-de
zle -N zle-vicmd-diw
zle -N zle-vicmd-dw

bindkey -M vicmd 'caw' zle-vicmd-caw
bindkey -M vicmd 'ciw' zle-vicmd-ciw
bindkey -M vicmd 'cw' zle-vicmd-cw
bindkey -M vicmd 'db' zle-vicmd-db
bindkey -M vicmd 'de' zle-vicmd-de
bindkey -M vicmd 'diw' zle-vicmd-diw
bindkey -M vicmd 'dw' zle-vicmd-dw

bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
