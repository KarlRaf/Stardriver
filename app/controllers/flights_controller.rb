  class FlightsController < ApplicationController

  def index
    @flights = Flight.search(params[:search])
  end

  def new
    @rocket = Rocket.find(params[:rocket_id])
    @flight = Flight.new
  end


  def create
    @flight = Flight.new(flight_params)
    @rocket = Rocket.find(params[:rocket_id])
    @flight.rocket = @rocket
    if @flight.save
      # should redirect to the dashboard, for now redirect to home page
      redirect_to rocket_flights_path
    else
      render :new
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def flight_params
    params.require(:flight).permit(:description, :date, :departure, :destination, :rocket_id)
  end

end
