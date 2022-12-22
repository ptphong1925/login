class Admin < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    has_many :articles, as: :poster
    has_many :songs, as: :poster
    has_many :videos, as: :poster
    has_many :comments, as: :commenter
    has_many :subcomments, as: :subcommenter
    has_many :likes, as: :liker
    has_many :followables, as: :follower, class_name: "Follow", foreign_key: 'follower_id'
    has_many :followers, as: :followable, class_name: "Follow", foreign_key: 'followable_id'
    has_many :frienders, as: :friendable, class_name: "Friend", foreign_key: 'friendable_id'
    has_many :friendables, as: :friender, class_name: "Friend", foreign_key: 'friender_id'

    has_many :rates, as: :rater


    def admin?
        true
    end

    def role
        "admin"
    end

end
