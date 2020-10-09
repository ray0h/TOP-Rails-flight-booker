class AddAirportReferenceToFlights < ActiveRecord::Migration[6.0]
  def change
    add_reference :flights, :origination
    add_reference :flights, :destination
  end
end
