class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    Trip.create(trip_params)
    redirect_to root_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :location)
  end
end
