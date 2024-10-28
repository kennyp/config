function watch_files -d "watch files with the given extension and run a command whenever they're updated" -a ext
  set pattern '\\.'$ext'$'
  set cmd $argv[2..-1]
  inotifywait -m -r -e close_write --format '%w%f' . | while read file
    if string match -r -- $pattern $file
      echo "Detected change in $file"
      eval $cmd
    end
  end
end
