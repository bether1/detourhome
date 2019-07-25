class Traveler::TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.valid?
      redirect_to traveler_trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:id])

    @destinations = @trip.destinations

    @sum_coords = { lat: 0, lng: 0 }  

    @destinations.each do | destination |
      @sum_coords[:lat] = @sum_coords[:lat] + destination.latitude
      @sum_coords[:lng] = @sum_coords[:lng] + destination.longitude
    end

     @average_coords = {
       lat: @sum_coords[:lat]/@destinations.count,
       lng: @sum_coords[:lng]/@destinations.count
     }
   end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :address)
  end
end



