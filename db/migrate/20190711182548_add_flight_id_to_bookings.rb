class AddFlightIdToBookings < ActiveRecord::Migration[5.2]
  def change
    change_table :bookings do |t|
      t.integer :flight_id
    end
  end
end
