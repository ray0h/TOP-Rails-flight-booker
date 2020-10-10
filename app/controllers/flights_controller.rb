class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    flight = Flight.all
    @dates = flight.dep_dates
    @flights = flight.search(params[:search])
  end
end
