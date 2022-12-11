class Catalogue < ApplicationRecord
    has_many :catalogue_childrent, class_name: "Catalogue", foreign_key: "catalogue_parent_id"
    belongs_to :catalogue_parent, class_name: "Catalogue", optional: true
end
