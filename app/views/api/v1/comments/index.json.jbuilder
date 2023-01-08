json.array! @comments do |comment|
  json.id comment.id
  json.content comment.content
  json.commenter do
    json.partial! 'api/v1/users/user', user: comment.commenter
  end
end