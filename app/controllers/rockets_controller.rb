class RocketsController < ApplicationController

  def new
    @user = current_user
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @user = current_user
    @rocket.user = @user
    if @rocket.save
      redirect_to rocket_path(@rocket)
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
