class AddFlightIdToPassenger < ActiveRecord::Migration[5.2]
  def change
    change_table :passengers do |t|
      t.integer :flight_id
    end
  end
end
