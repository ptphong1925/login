class Friend < ApplicationRecord
  belongs_to :friender, polymorphic: true
  belongs_to :friendable, polymorphic: true

  validate :friend_uniqueness, on: :create

  def friend_uniqueness
    person1 = self.friender_type.constantize.find(self.friender_id)
    person2 = self.friendable_type.constantize.find(self.friendable_id)
    if Friend.friend_reacted?(person1, person2)
      errors.add("Friend is reacted!")
    end
  end
  
end
