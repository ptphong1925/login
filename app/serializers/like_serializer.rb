class LikeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :liker
  has_one :likeable
end
