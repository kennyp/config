# settings

set unstable := true
set script-interpreter := ['bash', '-eu', '-o', 'pipefail']

[script]
[doc("show this")]
help:
    just banner "Recipes"
    just --list --list-heading "" --justfile {{ justfile() }} --color always | column -t -s '#'
    just break

    just banner "Utilities"
    {
        for u in stow op; do
            printf '    %s \e[34m## %s\e[0m\n' "${u}" "$(which ${u})"
        done
    } | column -t -s '#'
    just break

all := shell("find . -maxdepth 1 -type d -not -path '.' -not -path './.git' | sed -e 's|^./||' | tr '\n' ' '")

[script]
[doc("adopt packages")]
adopt *packages="all":
    for p in {{ if packages == "all" { all } else { packages } }}; do
        just log "adopting ${p}"
        find "${p}" -name '*.tmpl' -exec just generate {} \;
        stow --ignore="\.tmpl" --dotfiles -t "${HOME}" --adopt "${p}"
    done

[doc("generate file from template")]
@generate template:
    op inject -f -i {{ template }} -o {{ trim_end_match(template, ".tmpl") }} | \
        sed -e "s|$(pwd)/\?|    generated |"

[private]
@banner message:
    printf '\e[30;43;1m %-80s\e[0m\n\n' '{{ message }}'

[private]
@log message:
    printf "\033[34;1m▶\033[0m %s…\n" "{{ message }}"

[private]
@break:
    printf '\n'
