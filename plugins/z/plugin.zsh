### z / zeesh! plugin

##desc
# adds z navigation/completion
##csed

source ~/.zsh/plugins/z/lib/z.sh

# precmd is called just before the prompt is printed
function precmd() {
    title "%n@%m:%~"
    z --add "$(pwd -P)"
}
