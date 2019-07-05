class BookingsController < ApplicationController
  def new
    @number_of_passengers = params.require(:passengers).to_i
  end
end
