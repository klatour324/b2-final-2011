class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_departure
  end
end
