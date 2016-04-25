class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = attraction_from_params
  end

  def index
    @attractions = Attraction.all
  end

  def ride
    ride = Ride.new(user_id:current_user.id, attraction_id:params[:id])
    ride_result = ride.take_ride
    if ride_result==true
      redirect_to user_path(current_user), notice:"Thanks for riding the #{ride.attraction.name}!"
    else
      redirect_to user_path(current_user), alert:ride_result
    end
  end

  def edit
    @attraction = attraction_from_params
  end

  def update
  end

  def destroy
    @attraction = attraction_from_params
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def attraction_from_params
    Attraction.find_by(id: params[:id])
  end
end
