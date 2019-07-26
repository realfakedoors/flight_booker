class RemoveFlightIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :flight_id, :integer
  end
end
