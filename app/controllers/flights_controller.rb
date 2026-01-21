class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.name, a.id ] }
    @flights = Flight.all.map { |f| [ f.departure_date, f.id ] }
  end
end
