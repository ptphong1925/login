class Follow < ApplicationRecord
  belongs_to :follower, polymorphic: true, counter_cache: true
  belongs_to :followable, polymorphic: true, counter_cache: true
end
