class Rate < ApplicationRecord
  belongs_to :rater, polymorphic: true
  belongs_to :rateable, polymorphic: true

  def self.average_rate(record) #record = book + song
    array_rates = record.rates.pluck(:rate).map(&:to_i)
    array_rates.sum/array_rates.size
  end
  
end
