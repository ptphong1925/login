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

end