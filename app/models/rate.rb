class Rate < ApplicationRecord
  belongs_to :rater, polymorphic: true
  belongs_to :rateable, polymorphic: true
end
