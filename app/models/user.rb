class User < ApplicationRecord
    has_secure_password
    enum role: { basic: 'basic', admin: 'admin', author: 'author' }
    scope :authors, -> { where(role: :author) }

    has_many :books


end
