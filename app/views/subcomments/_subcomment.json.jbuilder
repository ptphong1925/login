json.extract! subcomment, :id, :content, :status, :commenter_id, :commenter_type, :comment_id, :likes_count, :created_at, :updated_at
json.url subcomment_url(subcomment, format: :json)
