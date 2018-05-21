class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:destination])
  end
end
