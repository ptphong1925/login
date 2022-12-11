json.extract! video, :id, :title, :content, :catalogue, :poster_id, :poster_type, :created_at, :updated_at
json.url video_url(video, format: :json)
