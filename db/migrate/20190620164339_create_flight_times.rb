class CreateFlightTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_times do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.string :duration

      t.timestamps
    end
    add_index :flight_times, :origin_id
  end
end