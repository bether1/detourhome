class Traveler::DestinationsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.create(destination_params)
    redirect_to traveler_trip_path(@trip)
  end

  def show
    @destination = Destination.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @journal = Journal.new
  end


  private

  def destination_params
    params.require(:destination).permit(:name, :address)
  end
end
