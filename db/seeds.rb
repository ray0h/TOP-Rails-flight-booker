# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db:reset - auto drops/create/seed?

# this will result in primary id's increasing sequentially
# Airport.delete_all
# Flight.delete_all


codes = %w[SFO LGA ATL ORD]
codes.each do |code|
  Airport.create(code: code)
end

# Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 9, 0, 0), depart_id: 1, arrival_id: 2, flight_time: '4h19m')
# Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 11, 15, 0), depart_id: 1, arrival_id: 2, flight_time: '4h19m')
# Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 4, 5, 0), depart_id: 2, arrival_id: 1, flight_time: '4h52m')
# Flight.create(dep_date: Date.new(2020, 10, 20), dep_time: Time.new(2020, 10, 20, 18, 25, 0), depart_id: 2, arrival_id: 1, flight_time: '4h52m')
# Flight.create(dep_date: Date.new(2020, 10, 21), dep_time: Time.new(2020, 10, 21, 7, 30, 0), depart_id: 1, arrival_id: 2, flight_time: '4h23m')
# Flight.create(dep_date: Date.new(2020, 10, 21), dep_time: Time.new(2020, 10, 21, 11, 43, 0), depart_id: 1, arrival_id: 2, flight_time: '4h23m')
# Flight.create(dep_date: Date.new(2020, 10, 21), dep_time: Time.new(2020, 10, 21, 8, 55, 0), depart_id: 2, arrival_id: 1, flight_time: '4h46m')
# Flight.create(dep_date: Date.new(2020, 10, 21), dep_time: Time.new(2020, 10, 21, 13, 55, 0), depart_id: 2, arrival_id: 1, flight_time: '4h46m')
# Flight.create(dep_date: Date.new(2020, 10, 22), dep_time: Time.new(2020, 10, 22, 10, 55, 0), depart_id: 1, arrival_id: 2, flight_time: '4h25m')
# Flight.create(dep_date: Date.new(2020, 10, 22), dep_time: Time.new(2020, 10, 22, 14, 33, 0), depart_id: 1, arrival_id: 2, flight_time: '4h25m')
# Flight.create(dep_date: Date.new(2020, 10, 22), dep_time: Time.new(2020, 10, 22, 12, 56, 0), depart_id: 2, arrival_id: 1, flight_time: '4h50m')
# Flight.create(dep_date: Date.new(2020, 10, 22), dep_time: Time.new(2020, 10, 22, 19, 56, 0), depart_id: 2, arrival_id: 1, flight_time: '4h50m')

# method to create random (but realistic) flight time
def flight_time(city1, city2)
  cities = [city1, city2]

  if cities.include?('SFO') && cities.include?('LGA')
    min = Array(330..345).sample
  elsif (cities.include?('SFO') && cities.include?('ORD')) || (cities.include?('SFO') && cities.include?('ATL'))
    min = Array(225..255).sample
  else
    min = Array(100..135).sample
  end
  "#{min / 60}h#{min % 60}min"
end

# create flights for three days starting tomorrow
(1..3).each do |i|
  date = Date.today + i

  # loop through airport cities (first)
  codes.each do |dep_city|

    # loop through airport cities (second)
    codes.each do |arr_city|

      # skip if city1 == city2
      next if dep_city == arr_city

      # create 3 flights with random dep time in morning/afternoon/evening
      morn = Time.new(2001, 1, 1, Array(6..11).sample, Array(0..59).sample, 0)
      aftn = Time.new(2001, 1, 1, Array(12..17).sample, Array(0..59).sample, 0)
      even = Time.new(2001, 1, 1, Array(18..22).sample, Array(0..59).sample, 0)
      arrival = Airport.find_by(code: arr_city).id
      depart = Airport.find_by(code: dep_city).id

      Flight.create(dep_date: date, dep_time: morn, flight_time: flight_time(dep_city, arr_city), arrival_id: arrival, depart_id: depart)
      Flight.create(dep_date: date, dep_time: aftn, flight_time: flight_time(dep_city, arr_city), arrival_id: arrival, depart_id: depart)
      Flight.create(dep_date: date, dep_time: even, flight_time: flight_time(dep_city, arr_city), arrival_id: arrival, depart_id: depart)

    end
  end
end
