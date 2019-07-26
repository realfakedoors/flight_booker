class AddBookingIdToPassengers < ActiveRecord::Migration[5.2]
  def change
    change_table :passengers do |t|
      t.integer :booking_id
    end
  end
end
