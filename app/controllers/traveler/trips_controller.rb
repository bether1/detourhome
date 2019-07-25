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
    ##@trip was the only thing under show until this last effort with Jared
    #### everything below here would be in trips controller
    #### get all destinations for trip

    @destinations = @trip.destinations

    @sum_coords = { lat: 0, lng: 0 }  

    @destinations.each do | destination |
      @sum_coords[:lat] = @sum_coords[:lat] + destination.latitude
      @sum_coords[:lng] = @sum_coords[:lng] + destination.longitude
    end

    #### defines sum_cords as the sum of all latitued and longatutes in
    #### the destination table for this trip

     @average_coords = {
       lat: @sum_coords[:lat]/@destinations.count,
       lng: @sum_coords[:lng]/@destinations.count
     }
     puts "++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++"     
     puts "++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++"     
     puts "++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++
     ++++++++++++++++++++++++++++++++++++++++++++++++++++"
     puts @average_coords
    ##### average_cords takes the sum above and gets the average
    ##### this will let me center on the average of the lat/lng so the map
    ##### can fit all of the destination markers
    ##### the logic above is correct but the syntax is in JS.  Need to move it to Ruby
   end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :address)
  end
end



