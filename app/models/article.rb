class Article < ApplicationRecord
  belongs_to :poster, polymorphic: true
end
