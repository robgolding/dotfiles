export PATH="/Users/rob/bin:/opt/homebrew/bin:$PATH"

if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_vi_key_bindings

    bind -M insert \cr history-pager

    set fish_cursor_default block
    set fish_cursor_insert block

    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    export ESCDELAY=1

    alias ls='ls -p'
    alias l='ls'
    alias ll='ls -l'

    alias clearpyc='find . -name "*.pyc" | xargs rm'
    alias cleardirs='find . -type d | xargs rmdir 2>/dev/null'
    alias cpd='clearpyc && cleardirs'

    alias grep='grep --color=always'

    alias json='python -m json.tool'

    alias gc="git commit"
    alias gpl="git pull"
    alias gps="git push"
    alias gm="git merge"
    alias gb="git branch"

    alias vim=nvim

    alias k=kubectl
    alias kx=kubectx

    alias dc=docker-compose

    starship init fish | source
    scmpuff init --shell=fish | source
    direnv hook fish | source

    function scmpuff_clear_vars
        set -l scmpuff_env_char "e"
        set -l scmpuff_env_vars (set -x | awk '{print $1}' | grep -E '^'$scmpuff_env_char'[0-9]+')

        for v in $scmpuff_env_vars
            set -e $v 2>/dev/null
        end
    end
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

export PATH="$_asdf_shims:$PATH"

set --erase _asdf_shims

export PATH="$HOME/.zdocs/bin:$PATH"
