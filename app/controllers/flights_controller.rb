class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:search])
  end

  private

  def flight_params
    params.require(:flight).permit(:destination, :search)
  end
end
