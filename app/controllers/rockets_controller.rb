class RocketsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @user = User.find(params[:user_id])
    @rocket.user = @user
    if @rocket.save
    # should redirect to the dashboard, for now redirect to home page
      redirect_to rocket_flight(@rocket)
    else
      render :new
    end
  end

  def show
    @rocket = Rocket.find(params[:id])
  end


  private

  def rocket_params
    params.require(:rocket).permit(:capacity, :model, :user_id)
  end

end
