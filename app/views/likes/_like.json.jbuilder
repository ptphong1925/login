json.extract! like, :id, :liker_id, :liker_type, :likeable_id, :likeable_type, :created_at, :updated_at
json.url like_url(like, format: :json)
