class ChangeBookingIdToBelongsToBookingInPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :booking_id, :integer
    
    change_table :passengers do |t|
      t.belongs_to :booking
    end
  end
end
