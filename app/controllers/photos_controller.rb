class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @destination = Destination.find(params[:destination_id])
    @destination.photo.create(photo_params.merge(user: current_user))
    redirect_to traveler_trip_destination_path(@destination)
  end

  private

  def photo_params
    params_require(:photo).permit(:picture)

end
