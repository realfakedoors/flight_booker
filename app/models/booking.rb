class Booking < ApplicationRecord
  belongs_to :departing, class_name: 'Flight', required: false
  belongs_to :arriving,  class_name: 'Flight', required: false
  has_many   :passengers, foreign_key: 'booking_id'
  accepts_nested_attributes_for :passengers
end
