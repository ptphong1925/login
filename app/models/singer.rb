class Singer < User
    self.table_name = 'users'
    default_scope { where(role: :singer) }

    has_many :songs, as: :poster
    




end