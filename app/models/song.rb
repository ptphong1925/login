class Song < ApplicationRecord
  belongs_to :poster, polymorphic: true
end
