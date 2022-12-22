class User < ApplicationRecord
    has_secure_password
    validate :username_uniqueness, on: :create

    enum role: { basic: 'basic', author: 'author', singer: 'singer' }
    
    has_many :articles, as: :poster
    has_many :songs, as: :poster
    has_many :videos, as: :poster
    has_many :comments, as: :commenter
    has_many :subcomments, as: :subcommenter
    has_many :likes, as: :liker
    has_many :followables, as: :follower, class_name: "Follow", foreign_key: 'follower_id'
    has_many :followers, as: :followable, class_name: "Follow", foreign_key: 'followable_id'
    has_many :rates, as: :rater



    scope :authors, -> { where(role: :author) }
    scope :basics, -> { where(role: :basic) }
    scope :singers, -> { where(role: :singer) }

    def admin?
        false
    end

end
