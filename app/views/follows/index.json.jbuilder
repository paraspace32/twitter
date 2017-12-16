json.array!(@follows) do |follow|
  json.extract! follow, :id, :following, :user_id
  json.url follow_url(follow, format: :json)
end
