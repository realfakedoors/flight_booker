class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    
    @number_of_passengers = params.require(:passengers).to_i
    @number_of_passengers.times { @booking.passengers.build }
    
    @dep_flight  = Flight.find(params.require(:departing_flights).to_i)
    @ret_flight  = Flight.find(params.require(:returning_flights).to_i)
    
    @dep_airport = Airport.find(@dep_flight.departing_id).code
    @ret_airport = Airport.find(@dep_flight.arriving_id).code
  end
  
  def create
    @booking = Booking.new(booking_params)    
    if @booking.save
      send_thank_you_emails
      redirect_to booking_path(@booking)
    else
      redirect_to root_url
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    @dep     = @booking.departing
    @ret     = @booking.arriving
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:departing_id, :arriving_id, :number_of_passengers, passengers_attributes: [:name, :email])
  end
  
  def send_thank_you_emails
    passengers = @booking.passengers
    passengers.each do |passenger|
      PassengerMailer.with(passenger: passenger).thank_you_email.deliver_later
    end
  end
end