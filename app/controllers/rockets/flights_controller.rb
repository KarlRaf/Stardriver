class Rockets::FlightsController < ApplicationController

  def new
    @rocket = Rocket.find(params[:rocket_id])
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @rocket = Rocket.find(params[:rocket_id])
    @flight.rocket = @rocket
    if @flight.save
      redirect_to bookings_path
    else
      render :new
    end
  end

private

  def flight_params
    params.require(:flight).permit(:description, :date, :departure, :destination, :rocket_id)
  end

end
