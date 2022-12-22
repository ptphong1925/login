class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def username_uniqueness
    unless Admin.find_by(username: self.username).nil? && User.find_by(username: self.username).nil?
        errors.add(:username, "is not active")
    end
  end

  def follow?(person)
    self.followables.pluck(:followable_type, :followable_id).include?([person.class.name, person.id])
  end

  def followables_with
    self.followables.map { |followship| followship.followable }
  end

  def followers_with
    self.followers.map { |followship| followship.follower }
  end

  def average_rate
    array_rates = self.rates.pluck(:rate).map(&:to_i)
    array_rates.sum/array_rates.size
  end

  def friend?(person)
    case1 = self.friendables.where(accepted?: true).pluck(:friendable_type ,:friendable_id).include?([person.class.name, person.id])
    case2 = self.frienders.where(accepted?: true).pluck(:friender_type ,:friender_id).include?([person.class.name, person.id])
    case1 || case2
  end

  def self.friend_reacted?(person1, person2)
    case1 = Friend.pluck(:friender_type, :friender_id, :friendable_type, :friendable_id).include?([person1.class.name, person1.id, person2.class.name, person2.id])
    case2 = Friend.pluck(:friender_type, :friender_id, :friendable_type, :friendable_id).include?([person2.class.name, person2.id, person1.class.name, person1.id])
    case1 || case2
  end

end