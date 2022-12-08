class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  # def filter_keyword(keyword)
  #   where
  # end
end
