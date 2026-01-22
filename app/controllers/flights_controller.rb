class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.name, a.id ] }
    @flights = Flight.all.map { |f| [ f.departure_date, f.id ] }
    @departure_dates = Flight
      .distinct
      .pluck(:departure_date)
      .sort
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present?
      scope = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      )

      if params[:departure_date].present?
        scope = scope.where(departure_date: params[:departure_date])
      end

      @flight_search_results = scope
    end
  end
end
