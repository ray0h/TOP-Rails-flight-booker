class ConfirmationMailer < ApplicationMailer
  # layout 'layouts/mailer'
  default from: 'theodinprojectairlines@gmail.com'
  
  def convert_code(code)
    airports = {
      'SFO' => 'San Francisco, CA (San Francisco International Airport)',
      'ATL' => 'Atlanta, GA (Hartsfield-Jackson International Airport)',
      'ORD' => "Chicago, IL (O'Hare International Airport)",
      'LGA' => "New York, NY (LaGuardia Airport)"
    }
    airports[code]
  end

  def confirm_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    @dep_city = Airport.find(@flight.depart_id).code
    @d_city = convert_code(@dep_city)
    @arr_city = Airport.find(@flight.arrival_id).code
    @a_city = convert_code(@arr_city)
    # attachements['odin_logo.svg']
    # File.read('/assets/images/odin_logo.svg')
    mail(to: @passenger.email, subject: 'Flight Confirmation')
  end
end