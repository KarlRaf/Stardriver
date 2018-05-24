class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @flights = Flight.all.last(6)
    #flights = @flights.sort_by{|flight| flight.destination}
    #@flights_by_dest = [flights.first]
    #flights.each.with_index do |flight, index|
    #  @flights_by_dest << flight if @flights_by_dest.last.destination != flight.destination
    #end
  end
end


