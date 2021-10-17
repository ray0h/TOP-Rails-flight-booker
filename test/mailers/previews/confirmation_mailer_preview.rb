class ConfirmationMailerPreview < ActionMailer::Preview
  def confirm_email
    ConfirmationMailer.with(passenger: Passenger.last, flight: Flight.find(Booking.find(Passenger.last.booking_id).flight_id)).confirm_email
  end
end