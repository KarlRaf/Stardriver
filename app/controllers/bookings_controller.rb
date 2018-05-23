class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new

  end

  def create
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.flight = @flight
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  # CHANGED TO VALIDATE USER DIRECTLY FROM INDEX
  def validates_user
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    redirect_to bookings_path
  end

  # NOT IN USE
  # def refuses_user
  #   @booking = Booking.find(params[:id])
  #   @booking.status = "Declined"
  #   @booking.save
  #   redirect_to booking_path(@booking)
  # end

  private

  def booking_params
    params.require(:booking).permit(:comments)
  end

end
