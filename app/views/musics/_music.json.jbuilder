json.extract! music, :id, :title, :content, :catalogue, :poster_id, :poster_type, :created_at, :updated_at
json.url music_url(music, format: :json)
