class AddBookingsAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :passenger
    add_reference :bookings, :flight
  end
end
