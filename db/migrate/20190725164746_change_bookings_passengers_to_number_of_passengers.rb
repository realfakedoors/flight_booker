class ChangeBookingsPassengersToNumberOfPassengers < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :passengers, :number_of_passengers
  end
end
