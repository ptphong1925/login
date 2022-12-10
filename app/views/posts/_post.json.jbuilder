json.extract! post, :id, :title, :content, :poster_id, :poster_type, :created_at, :updated_at
json.url post_url(post, format: :json)
