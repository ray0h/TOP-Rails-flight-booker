class FlightsController < ApplicationController
  def index
    flights = Flight.all
    dep_dates = flights.dep_dates
    days_to_add = dep_dates.select{ |d| d <= Date.today }.count
    if days_to_add
      # available flights go out a week; if all dates are past, set last date to today.  
      add_to_date = dep_dates.last < Date.today ? Date.today : dep_dates.last

      flights.each do |flight|
        next if flight.dep_date > Date.today
        gap = flight.dep_date.ld - dep_dates.first.ld 
        update_date = add_to_date + days_to_add + gap
        params = {
          dep_date: update_date,
          dep_time: flight.dep_time,
          flight_time: flight.flight_time,
          depart_id: flight.depart_id,
          arrival_id: flight.arrival_id,
          id: flight.id
        }
        flight.update(params)
      end
      flights = Flight.all
    end
    
    @airports = Airport.all
    @dates = flights.dep_dates
    @flights = flights.all.search(params[:search])
  end
end
