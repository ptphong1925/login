class Post < ApplicationRecord

  belongs_to :poster, polymorphic: true
  has_many :comments, as: :commentable
  
  has_one_attached :image
  has_rich_text :content
end
