json.extract! comment, :id, :content, :status, :commenter_id, :commenter_type, :commentable_id, :commentable_type, :likes_count, :created_at, :updated_at
json.url comment_url(comment, format: :json)
