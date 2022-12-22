class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many :comments, as: :commentable
  has_many :rates, as: :rateable

  # def filter_keyword(keyword)
  #   where
  # end
end
