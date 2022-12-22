class FriendSerializer < ActiveModel::Serializer
  attributes :id, :accepted?
  has_one :friender
  has_one :friendable
end
