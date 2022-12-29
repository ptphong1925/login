class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def username_uniqueness
    unless Admin.find_by(username: self.username).nil? && User.find_by(username: self.username).nil?
      errors.add(:username, "is not active")
    end
  end

  def self.header_sort(sort, direction)
    if sort.present? && direction.present?
      self.order("#{sort} #{direction}")
    else
      self.order(:id)
    end
  end

end