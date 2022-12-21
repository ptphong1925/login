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

end
