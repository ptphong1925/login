json.extract! song, :id, :title, :content, :catalogue, :status, :poster_id, :poster_type, :likes_count, :created_at, :updated_at
json.url song_url(song, format: :json)
