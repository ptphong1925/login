json.extract! post, :id, :title, :content, :catalogue, :status, :poster_id, :poster_type, :likes_count, :created_at, :updated_at
json.url post_url(post, format: :json)
