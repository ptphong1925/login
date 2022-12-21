json.extract! video, :id, :title, :content, :catalogue, :status, :poster_id, :poster_type, :likes_count, :created_at, :updated_at
json.url video_url(video, format: :json)
