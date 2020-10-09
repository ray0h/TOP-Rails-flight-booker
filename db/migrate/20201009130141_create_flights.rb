class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.date :dep_date
      t.time :dep_time
      t.string :flight_time

      t.timestamps
    end
  end
end
