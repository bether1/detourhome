class Traveler::PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @destination = Destination.find(params[:destination_id])
    @destination.photos.create(photo_params)
    redirect_to traveler_trip_destination_path(params[:trip_id], params[:destination_id])
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
