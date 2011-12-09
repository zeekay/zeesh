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

# delete
bindkey -M vicmd "^?" vi-delete-char
bindkey "^[[1~" vi-beginning-of-line   # Home
bindkey "^[[4~" vi-end-of-line         # End
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

bindkey '^[[2~' beep                   # Insert
bindkey '^[[3~' delete-char            # Del
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down
bindkey -M viins '^r' history-incremental-search-backward
# bindkey -M vicmd '^r' history-incremental-search-backward
# bindkey -M viins '^[[A' vi-history-search-backward
# bindkey -M viins '^[[B' vi-history-search-forward
# bindkey -M vicmd 'K' vi-history-search-backward
# bindkey -M vicmd 'J' vi-history-search-forward
