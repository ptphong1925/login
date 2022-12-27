json.extract! hashtag, :id, :name, :hashtags_count, :created_at, :updated_at
json.url hashtag_url(hashtag, format: :json)
