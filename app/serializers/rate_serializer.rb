class RateSerializer < ActiveModel::Serializer
  attributes :id, :rate
  has_one :rater
  has_one :rateable
end
