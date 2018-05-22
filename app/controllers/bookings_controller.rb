class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new

  end

  def create
    @booking = Booking.new()
    # @booking.status = "pending"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :comments)
  end

end
