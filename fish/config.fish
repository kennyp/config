source "/Users/kparnell/.asdf/asdf.fish"
source "/Users/kparnell/.asdf/completions/asdf.fish"
source "/Users/kparnell/.asdf/plugins/java/set-java-home.fish"
fish_add_path /Users/kparnell/.fzf/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr ls 'eza'
    abbr ll 'eza -lh --icons'
    abbr tree 'eza --tree --icons'
    abbr vim 'nvim'
    abbr p 'pushd ~/Projects/(find ~/Projects ~/Projects/playground -maxdepth 1 -type d | sed -e "s/^.*Projects//" -e "s/^\///" | grep -v "^\$" | sort -ru | fzf)'
    abbr gst 'git status -s'
    abbr gco 'git checkout'
    abbr ebrc 'nvim /Users/kparnell/.config/fish/config.fish && exec /usr/local/bin/fish'
    abbr h 'heroku'
    abbr hs 'heroku sudo'

    # set -x ZELLIJ_AUTO_ATTACH true
    set -x ZELLIJ_AUTO_ATTACH false
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
            zellij attach -c
        else
            zellij -l welcome
        end
    
        if test "$ZELLIJ_AUTO_EXIT" = "true"
            kill $fish_pid
        end
    end
end
