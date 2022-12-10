json.extract! comment, :id, :content, :commenter_id, :commenter_type, :commentable_id, :commentable_type, :created_at, :updated_at
json.url comment_url(comment, format: :json)
