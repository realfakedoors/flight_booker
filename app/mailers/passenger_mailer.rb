class PassengerMailer < ApplicationMailer
  default from: 'thankyou@flightbooker.com'
  
  def thank_you_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Thanks for booking your flight with us!')
  end
end
