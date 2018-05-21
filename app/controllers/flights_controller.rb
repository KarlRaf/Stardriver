class FlightsController < ApplicationController


  def new
    @flight = Flight.new
  end


  def create
    @flight = Flight.new(flight_params)
    @rocket = Rocket.find(params[:rocket_id])
    @flight.rocket = @rocket
    if @flight.save
      # should redirect to the dashboard, for now redirect to home page
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def flight_params
    params.require(:flight).permit(:description, :date, :departure, :dsetination, :rocket_id)
  end

end
