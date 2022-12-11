class Post < ApplicationRecord
  belongs_to :poster, polymorphic: true
  has_one_attached :image
end
