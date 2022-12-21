class Subcomment < ApplicationRecord
  belongs_to :commenter, polymorphic: true
  belongs_to :comment
end
