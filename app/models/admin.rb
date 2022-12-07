class Admin < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    def admin?
        true
    end

    private

    def username_uniqueness
        unless Admin.find_by(username: self.username).nil? && User.find(username: self.username).nil?
            errors.add(:username, "is not active")
        end
    end
end
