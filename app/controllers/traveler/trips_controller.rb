class Traveler::TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.create(trip_params)
    redirect_to traveler_trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :description, :location)
  end

end
