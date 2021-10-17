class BookingsController < ApplicationController
  def search
    return unless params[:id]

    ids = Booking.ids
    if params[:id].to_i.in?(ids)
      redirect_to booking_path(params[:id])
    else
      flash.now['error'] = 'No such booking confirmation number.'
    end
  end

  def new
    @booking = Booking.new
    (1..params[:no_pass].to_i).each do
      @booking.passengers.new
    end
    @flight = Flight.find(params[:flight])
  end

  def create
    @booking = Booking.new(booking_params)
    
    # respond_to do |format|
      if @booking.save
        @booking.passengers.each do |passenger|
          if passenger.email && passenger.email.length > 3
            ConfirmationMailer.with(passenger: passenger, flight: Flight.find(@booking.flight_id)).confirm_email.deliver!

            # format.html
            # format.json
          end
        end
        redirect_to booking_path(@booking)
      # end
    end
  
    # redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
