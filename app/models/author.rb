class Author < User
    self.table_name = 'users'
    default_scope { where(role: :author) }

    has_many :books
    




end