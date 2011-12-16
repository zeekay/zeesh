### vi-mode / zeesh! plugin

##desc
# vi-mode keybindings
##csed

# use vi mode keybindings
bindkey -v

bindkey -M vicmd "u" undo
bindkey -M vicmd "^R" redo
# bindkey "^P" vi-up-line-or-history
# bindkey "^N" vi-down-line-or-history
bindkey -M viins "^U" vi-change-whole-line
bindkey -M vicmd "^U" vi-change-whole-line
bindkey -M vicmd "^?" vi-delete-char

bindkey -M vicmd '\e[H'  vi-beginning-of-line
bindkey -M vicmd '\e[F'  vi-end-of-line
bindkey -M vicmd "^[[1~" vi-beginning-of-line   # Home
bindkey -M vicmd "^[[4~" vi-end-of-line         # End

bindkey '^[[2~' beep                   # Insert
bindkey '^[[3~' delete-char            # Del
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down
bindkey -M viins '' backward-delete-char
bindkey -M vicmd '' backward-delete-char
bindkey -M vicmd '^[[3~' delete-char
