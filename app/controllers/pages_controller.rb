class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @flights = Flight.all.last(6)
  #   @destinations = {}
  #   Flight.all.each do |flight|
  #     if @destinations.keys.include?(flight.destination)
  #       @destinations[flight.destination.to_s] += 1
  #     else
  #       @destinations = {flight.destination.to_s => 1}
  #     end
  #     @destinations.sort_by{ |_key, value| value }
  #     @destinations = @destinations.first(6)
  #   end
  # raise
  end
end


