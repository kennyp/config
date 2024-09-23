function mob-start -d "start a new mob session feature branch" -a feature
  git checkout -b "$feature"
  git push origin "$feature" --set-upstream
  mob start --include-uncommitted-changes
end

