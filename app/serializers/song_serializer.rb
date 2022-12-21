class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :catalogue, :status, :likes_count
  has_one :poster
end
