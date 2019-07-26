class RemoveBookedFlightIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :booked_flight_id
  end
end
