class Airport < ApplicationRecord
  has_many :flight_times, foreign_key: 'origin_id'
  has_many :flight_times, foreign_key: 'destination_id'
  has_many :departings, class_name: 'Flight', foreign_key: 'departing_id'
  has_many :arrivings,  class_name: 'Flight', foreign_key: 'arriving_id'
end
