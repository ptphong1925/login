class Subcomment < ApplicationRecord
  has_paper_trail
  belongs_to :subcommenter, polymorphic: true
  belongs_to :comment
  has_many :likes, as: :likeable
end
