# Glogal Variables
set -U XDG_CONFIG_HOME "$HOME/.config"

if test -f "$HOME/.asdf/asdf.fish"
  source "$HOME/.asdf/asdf.fish"
  source "$HOME/.asdf/completions/asdf.fish"

  for f in java/set-java-home.fish dotnet/set-dotnet-env.fish
    if test -f "$HOME/.asdf/plugins/$f"
      source "$HOME/.asdf/plugins/$f"
    end
  end
end

for d in "/usr/local/bin" "/opt/homebrew/bin" "$HOME/.fzf/bin" "$HOME/.cargo/bin" "$HOME/bin"
  if test -d "$d"
    fish_add_path -p -m "$d"
  end
end

# ASDF Stuff
set -x ASDF_GOLANG_MOD_VERSION_ENABLED false
set -x FLUTTER_ROOT (asdf where flutter)

if status is-interactive
  # General Terminal Stuff
  set -x TERM xterm-256color
  set -x EDITOR nvim

  # Commands to run in interactive sessions can go here
  abbr ls 'eza'
  abbr ll 'eza -lh --icons'
  abbr tree 'eza --tree --icons'
  abbr vim 'nvim'
  abbr p 'pushd ~/Projects/(find ~/Projects ~/Projects/playground -maxdepth 1 -type d | sed -e "s/^.*Projects//" -e "s/^\///" | grep -v "^\$" | sort -ru | fzf)'
  abbr gst 'git status -s'
  abbr gco 'git checkout'
  abbr ebrc "nvim $HOME/.config/fish/config.fish && exec /usr/local/bin/fish"
  abbr h 'heroku'
  abbr hs 'heroku sudo'
  abbr ze zellij edit
  abbr zr zellij run

  if type -q toggle_vpn
    complete -c toggle_vpn -f -a '(toggle_vpn complete)'
  end

  set -g __fish_git_prompt_show_informative_status true

  # set -x ZELLIJ_AUTO_ATTACH true
  # set -x ZELLIJ_AUTO_ATTACH false
  # if not set -q ZELLIJ
  #   if test "$ZELLIJ_AUTO_ATTACH" = "true"
  #     exec zellij attach -c
  #   else
  #     exec zellij -l welcome
  #   end
  # 
  #   if test "$ZELLIJ_AUTO_EXIT" = "true"
  #     kill $fish_pid
  #   end
  # end
end
