class AddPassengersToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :passengers, :string
  end
end
