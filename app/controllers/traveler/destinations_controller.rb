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
    @photo = Photo.new
  end


  private

  def destination_params
    params.require(:destination).permit(:name, :address, :picture)
  end
end


#with the exisitng create i get error.  unknown attribute 'trip_id' for Destination
# with the 'ul' tag in show.html.erb i can't get to th destination page
#i believe the error occurs when there is no destination to display.