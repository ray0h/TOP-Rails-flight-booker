class Airport < ApplicationRecord
  has_many :origination_flight, class_name: 'Flight', foreign_key: 'origination_id'
  has_many :destination_flight, class_name: 'Flight', foreign_key: 'destination_id'
end
