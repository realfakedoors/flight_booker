class ChangeFlightsFlightNumberToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :flights, :flight_number, :integer
  end
end
