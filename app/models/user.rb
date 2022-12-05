class User < ApplicationRecord
    has_secure_password
    enum role: { basic: 'basic', admin: 'admin', author: 'author' }
    scope :authors, -> { where(role: :author) }
    scope :basic_users, -> { where(role: :basic) }
    scope :admin, -> { where(role: :admin) }
    scope :not_admin, -> { where.not(role: :admin) }

    has_many :books


end
