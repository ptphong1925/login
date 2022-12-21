class SubcommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :status, :likes_count
  has_one :commenter
  has_one :comment
end
