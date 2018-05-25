  class FlightsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @flights = Flight.where("destination ILIKE :search OR departure ILIKE :search", search: "%#{params[:search]}%")
    else
      @flights = Flight.all
    end
  end

  def new
    @flight = Flight.new
  end

  def my_flights
    @flights = []
    Flight.all.each do |flight|
      @flights << flight if flight.rocket.user == current_user
    end
    return @flights
  end

  def create
    @flight = Flight.new(flight_params)
    @rocket = Rocket.find(flight_params[:rocket_id])
    @flight.rocket = @rocket
    if @flight.save
      respond_to do |format|
        format.html { redirect_to my_flights_path }
        format.js
      end
      # redirect_to bookings_path
    else
      respond_to do |format|
        format.html { render :new }
      end
      # render :new
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    if @flight.destroy
      respond_to do |format|
        format.html { redirect_to my_flights_path }
        format.js
      end
    end
    # redirect_to my_flights_path
  end

  def show
    @flight = Flight.find(params[:id])
  end

  private

  def flight_params
    params.require(:flight).permit(:description, :date, :departure, :destination, :rocket_id)
  end

end
