class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :catalogue, :year_published, :isbn, :price, :out_of_print, :views_count
  has_one :supplier
  has_one :user
end
