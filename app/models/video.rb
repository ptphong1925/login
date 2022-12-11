class Video < ApplicationRecord
  belongs_to :poster, polymorphic: true
  has_many :comments, as: :commentable
end
