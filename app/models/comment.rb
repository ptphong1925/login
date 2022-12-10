class Comment < ApplicationRecord
  belongs_to :commenter, polymorphic: true
  belongs_to :commentable, polymorphic: true
end
