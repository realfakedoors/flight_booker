class ChangeArrivingToArrivingIdAndDepartingToDepartingIdInBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :arriving,  :arriving_id
    rename_column :bookings, :departing, :departing_id
  end
end
