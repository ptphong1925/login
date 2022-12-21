class Admin < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    has_many :articles, as: :poster
    has_many :songs, as: :poster
    has_many :videos, as: :poster
    has_many :comments, as: :commenter
    has_many :subcomments, as: :subcommenter
    has_many :likes, as: :liker

    def admin?
        true
    end

    def role
        "admin"
    end

end
