source ~/.zsh_profile

export EDITOR="nvim"

function vim() {
    if [ -z "$@" ]; then
        nvim .
    else
        nvim $@
    fi
}
