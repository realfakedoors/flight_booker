class Passenger < ApplicationRecord
  belongs_to :booking, required: false
end
