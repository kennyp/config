function fish_prompt
  set last_status $status

  printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

  if test $last_status -ne 0
    printf ' %s[%d]%s' (set_color red) $last_status (set_color normal)
  end

  if test -n "$IN_NIX_SHELL"
    printf ' [nix]'
  end

  printf '> '
end
