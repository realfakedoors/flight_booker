class AddArrivingAndDepartingToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :arriving,  :string
    add_column :bookings, :departing, :string
  end
end
