# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db:reset / #db:create

# this will result in primary id's increasing sequentially
# Airport.delete_all
# Flight.delete_all


codes = %w[SFO NYC]
codes.each do |code|
  Airport.create(city: code)
end

Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 9, 0, 0), origination_id: 1, destination_id: 2, flight_time: '4h19m')
Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 18, 25, 0), origination_id: 2, destination_id: 1, flight_time: '4h52m')