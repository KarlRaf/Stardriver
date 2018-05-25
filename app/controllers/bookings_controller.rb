class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user)
    @mepilot = []
    Booking.all.each do |booking|
      @mepilot << booking if booking.flight.rocket.user == current_user
    end
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
    @booking.status = "Pending"
    @booking.flight = @flight
    @booking.user = current_user
    if @booking.save
      respond_to do |format|
        format.html { redirect_to bookings_path }
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
  def refuses_user
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:comments)
  end

end
