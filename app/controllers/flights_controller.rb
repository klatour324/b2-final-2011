class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_departure
  end

  def show
    @flight = Flight.find(params[:id])
    # @flight.passengers.eighteen_and_older
    # @flight.passengers.average_age_of_adult_passengers
  end
end
