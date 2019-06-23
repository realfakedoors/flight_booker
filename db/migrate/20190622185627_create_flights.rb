class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.integer :departing_id
      t.integer :arriving_id
      t.string :day
      t.string :etd
      t.string :eta
      t.string :duration
      t.string :captain

      t.timestamps
    end
    add_index :flights, [:departing_id, :day]
    add_index :flights, [:arriving_id,  :day]
  end
end
