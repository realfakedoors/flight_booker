QUARTER_HOURS = [":00", ":15", ":30", ":45"]
DAYS_OF_THE_WEEK = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

#First we make a list of random fictional airports,
until Airport.count == 50 do
  airport_code = ('A'..'Z').to_a.sample(3).join
  Airport.create!(code: airport_code)
end

#then randomly generate estimated flight times between each airport, recording the time both ways.
Airport.all.to_a.combination(2).each do |origin, destination|
  random_duration = "#{(2..16).to_a.sample}#{QUARTER_HOURS.sample}"
  FlightTime.create!(origin: origin, destination: destination, duration: random_duration)
  FlightTime.create!(origin: destination, destination: origin, duration: random_duration)
end

#Finally, we'll create a few flights each day of the week between each airport.
def time_of_day
  "#{("0".."23").to_a.sample}#{QUARTER_HOURS.sample}"
end
  
def daily_flights
  flights = Array.new((2..4).to_a.sample)
  flights.map!{time_of_day}.sort.sort_by{|time| time.length}
end

def flight_number
  Array.new((1..4).to_a.sample).map{("0".."9").to_a.sample}.join
end

def grab_times(time_str)
  time_str.prepend("0") if time_str.match('^\d{1}:')
  time_str.match('(\d{2}):(\d{2})')[1..2].map{|d| d.to_i}
end

def calculate_eta(etd, duration)
   departure = grab_times(etd)  
      course = grab_times(duration)
     
    eta_hour = departure.first + course.first
  eta_minute = departure.last  + course.last
 
  if eta_minute >= 60
      eta_hour += 1
    eta_minute -= 60
  end
 
  eta_minute = "00" if eta_minute == 0
 
  "#{eta_hour}:#{eta_minute}"
end
  
Airport.all.each do |origin|
  Airport.all.each do |destination|
    next if destination == origin
    DAYS_OF_THE_WEEK.each do |day|
      daily_flights.each do |flight|
        duration = FlightTime.find_by(origin: origin, destination: destination).duration
        Flight.create!(
         flight_number: flight_number,
             departing: origin,
              arriving: destination,
                   day: day,
                   etd: flight,
              duration: duration,
                   eta: calculate_eta(flight, duration),
               captain: Faker::Name.name)
      end
    end
  end
end