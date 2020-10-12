class RenameMiscColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :airports, :city, :code
    rename_column :flights, :origination_id, :depart_id
    rename_column :flights, :destination_id, :arrival_id
  end
end
