class Flight < ApplicationRecord
  belongs_to :departing,  class_name: 'Airport'
  belongs_to :arriving,   class_name: 'Airport'
  has_many   :bookings,   foreign_key: 'departing'
end
