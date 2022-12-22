json.extract! follow, :id, :follower_id, :follower_type, :followable_id, :followable_type, :created_at, :updated_at
json.url follow_url(follow, format: :json)
