class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @booking = Booking.new()
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :comments)
  end

end
