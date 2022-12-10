class Post < ApplicationRecord
  belongs_to :poster, polymorphic: true
end
