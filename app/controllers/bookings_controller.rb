class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    num_passengers = params[:num_tickets].to_i
    num_passengers.times { @booking.passengers.build }

    Rails.logger.debug "NUM_TICKETS: #{params[:num_tickets]}"
    Rails.logger.debug "PASSENGERS COUNT: #{@booking.passengers.size}"
  end
  def create
    @booking = Booking.new(passenger_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end


private

  def passenger_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [ :name, :email ]
    )
  end
end
