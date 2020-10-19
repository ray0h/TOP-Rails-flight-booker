class PassengerMailer < ApplicationMailer
  # add another default to overide?

  def confirmation_mail
    @booking = params[:booking]
    @passengers = @booking.passengers
    @pass_emails = @passengers.map(&:email)
    @url = "http://localhost:3000/bookings/#{@booking.id}"
    mail(to: @pass_emails, subject: 'Booking confirmation')
  end
end
