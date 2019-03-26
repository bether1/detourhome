class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    current_user.trip.create(trip_params)
    redirect_to root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :location)
  end
end
