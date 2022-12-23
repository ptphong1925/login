class Follow < ApplicationRecord
  belongs_to :follower, polymorphic: true, counter_cache: true
  belongs_to :followable, polymorphic: true, counter_cache: true

  def self.follow?(person1, person2)
    person1.followables.pluck(:followable_type, :followable_id).include?([person2.class.name, person2.id])
  end

  def self.followables_of(person)
    person.followables.map { |followship| followship.followable }
  end

  def self.followers_of(person)
    person.followers.map { |followship| followship.follower }
  end
  
end
