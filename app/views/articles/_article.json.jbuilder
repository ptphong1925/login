json.extract! article, :id, :title, :content, :catalogue, :status, :poster_id, :poster_type, :likes_count, :created_at, :updated_at
json.url article_url(article, format: :json)
