class Friend < ApplicationRecord
  belongs_to :friender, polymorphic: true
  belongs_to :friendable, polymorphic: true

  validate :friend_uniqueness, on: :create

  def self.friend_reacted?(person1, person2)
    case1 = Friend.pluck(:friender_type, :friender_id, :friendable_type, :friendable_id).include?([person1.class.name, person1.id, person2.class.name, person2.id])
    case2 = Friend.pluck(:friender_type, :friender_id, :friendable_type, :friendable_id).include?([person2.class.name, person2.id, person1.class.name, person1.id])
    case1 || case2
  end

  def self.friend_together?(person1, person2)
    case1 = person1.friendables.where(accepted?: true).pluck(:friendable_type ,:friendable_id).include?([person2.class.name, person2.id])
    case2 = person1.frienders.where(accepted?: true).pluck(:friender_type ,:friender_id).include?([person2.class.name, person2.id])
    case1 || case2
  end

  def self.friends_of(person)
    friends = []
    array_of_Friend = Friend.where(friender_type: person.class.name, friender_id: person.id, accepted?: true).pluck(:friendable_type, :friendable_id)
    array_of_Friend += Friend.where(friendable_type: person.class.name, friendable_id: person.id, accepted?: true).pluck(:friender_type, :friender_id)
    array_of_Friend.map { |class_name, id| class_name.constantize.find(id) }
  end

  def friend_uniqueness
    person1 = self.friender_type.constantize.find(self.friender_id)
    person2 = self.friendable_type.constantize.find(self.friendable_id)
    if Friend.friend_reacted?(person1, person2)
      errors.add("Friend is reacted!")
    end
  end


end
