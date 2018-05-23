class RocketsController < ApplicationController
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def new
    @user = current_user
    @rocket = Rocket.new
    authorize @rocket
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @rocket.user = current_user
    @rocket.model = Rocket::ROCKETS[params[:rocket][:model]][:model]
    @rocket.capacity = Rocket::ROCKETS[params[:rocket][:model]][:capacity]
    authorize @rocket
    if @rocket.save
      redirect_to new_rocket_flight_path(@rocket)
    else
      render :new
    end
  end

  def show
    @rocket = Rocket.find(params[:id])
    authorize @rocket
  end

  def edit
    @rocket = Rocket.find(params[:id])
    authorize @rocket
  end

  def update
    @rocket = Rocket.find(params[:id])
    authorize @rocket
    @rocket.update(rocket_params)
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  def destroy
    @rocket = Rocket.find(params[:id].to_i)
    authorize @rocket
    @rocket.destroy
    redirect_to user_path(current_user)
  end


  private

  def rocket_params
    params.require(:rocket).permit(:name, :user_id, :photo)
  end

end
