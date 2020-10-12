class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    (1..params[:no_pass].to_i).each do
      @booking.passengers.new
    end
    @flight = Flight.find(params[:flight])
    flash['flight'] = @flight.id
  end

  def create
    p params
    @booking = Booking.new(booking_params)
    p @booking
    p @booking.flight
    @booking.save

    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
