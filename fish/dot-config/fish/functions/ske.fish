function ske -d "perform a search with rg and open the selected file" -a type
  if [ -z $type ]
    set -f out (sk --ansi -i --cmd-prompt 'rg> ' -c 'rg -n --color ansi "{}"' --preview '~/bin/preview.sh {}' | cut -d: -f1,2 | sed -e 's/:/\n/')
  else
    set -f out (sk --ansi -i --cmd-prompt 'rg> ' -c "rg -t $type -n --color ansi '{}'" --preview '~/bin/preview.sh {}' | cut -d: -f1,2 | sed -e 's/:/\n/')
  end
  nvim $out[1] (printf '+%d' $out[2])
end

