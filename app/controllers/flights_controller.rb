class FlightsController < ApplicationController
  require 'date'

  def index
    @airports = Airport.all.map{ |a| [ a.code, a.id ] }
    @number_of_passengers = (1..4).to_a
    
    @departing_flights = find_flights(:departing_date, departing_airport, arriving_airport)
    @returning_flights = find_flights(:returning_date, arriving_airport,  departing_airport)
    
    @passengers = params.require(:passengers)
  end
  
  private
  
  def departing_airport
    params.require(:departing_airport).to_i
  end
  
  def arriving_airport
    params.require(:arriving_airport).to_i
  end
  
  def find_flights(date, from_airport, to_airport)
    date  = params.require(date.to_s).permit(:month, :day, :year)
    year  = date["year"].to_i
    month = date["month"].to_i
    day   = date["day"].to_i
    
    # in case someone enters a date like February 31st:
    begin
      day_of_the_week = Date.new(year, month, day).strftime('%A')
    rescue ArgumentError
      day_of_the_week = "invalid"
    end
    
    Flight.where( day:          day_of_the_week,
                  departing_id: from_airport,
                  arriving_id:  to_airport ).to_a
  end
end