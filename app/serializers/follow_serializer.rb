class FollowSerializer < ActiveModel::Serializer
  attributes :id
  has_one :follower
  has_one :followable
end
