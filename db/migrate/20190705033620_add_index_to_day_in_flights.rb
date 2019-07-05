class AddIndexToDayInFlights < ActiveRecord::Migration[5.2]
  def change
    change_table :flights do |t|
      t.index :day
    end
  end
end
