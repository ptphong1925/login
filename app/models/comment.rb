class Comment < ApplicationRecord
  has_paper_trail
  belongs_to :commenter, polymorphic: true
  belongs_to :commentable, polymorphic: true
  has_many :subcomments
  has_many :likes, as: :likeable
end
