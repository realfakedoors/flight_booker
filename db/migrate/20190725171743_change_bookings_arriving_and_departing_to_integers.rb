class ChangeBookingsArrivingAndDepartingToIntegers < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :arriving, :integer
    change_column :bookings, :departing, :integer
  end
end
