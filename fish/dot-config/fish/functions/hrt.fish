function hrt -d "retry most recent app release" -a app
  if not string length --quiet $app
    printf "usage: hrt app_name\n" >&2
    return 1
  end

  heroku api GET /apps/$app/releases \
  | jq 'sort_by(.created_at) | last | { "slug": .slug.id, "description": "Retry of v\(.version): \(.description)" }' \
  | heroku api POST /apps/$app/releases
end

