class Admin < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    has_many :posts, as: :poster
    has_many :musics, as: :poster
    has_many :videos, as: :poster
    has_many :comments, as: :commenter

    def admin?
        true
    end

    def role
        "admin"
    end

    private

    # def username_uniqueness
    #     unless Admin.find_by(username: self.username).nil? && User.find_by(username: self.username).nil?
    #         errors.add(:username, "is not active")
    #     end
    # end
end
