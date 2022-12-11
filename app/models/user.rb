class User < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    enum role: { basic: 'basic', author: 'author' }

    has_many :post, as: :poster
    
    scope :authors, -> { where(role: :author) }
    scope :basics, -> { where(role: :basic) }

    has_many :books

    def admin?
        false
    end

    private
    def username_uniqueness
        unless Admin.find_by(username: self.username).nil? && User.find_by(username: self.username).nil?
            errors.add(:username, "is not active")
        end
    end
end
