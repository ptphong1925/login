class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :status, :likes_count
  has_one :commenter
  has_one :commentable
end
