class Booking < ApplicationRecord
  helongs_to :passenger
  belongs_to :flight
end