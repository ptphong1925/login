class Like < ApplicationRecord
  belongs_to :liker, polymorphic: true
  belongs_to :likeable, polymorphic: true, counter_cache: true

  def self.liked?(person, record)
    person.likeables.pluck(:likeable_type, :likeable_id).included?([record.class.name, record.id])
  end
end
