class Song < ApplicationRecord
  belongs_to :poster, polymorphic: true
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :rates, as: :rateable

end
