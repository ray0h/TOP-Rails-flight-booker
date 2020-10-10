class Airport < ApplicationRecord
  has_many :dep_flight, class_name: 'Flight', foreign_key: 'origination_id'
  has_many :arr_flight, class_name: 'Flight', foreign_key: 'destination_id'
end
