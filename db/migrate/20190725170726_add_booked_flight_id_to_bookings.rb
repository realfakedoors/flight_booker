class AddBookedFlightIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booked_flight_id, :integer
  end
end
