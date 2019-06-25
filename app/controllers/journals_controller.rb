class JournalsController < ApplicationController
  before_action :authenticate_user!

  def create
    @destination = Destination.find(params[:destination_id])
    @destination.journals.create(journal_params.merge(user: journal_user))
    redirect_to traveler_trip_destination_path(@destination)
  end

  private

  def journal_params
    params.require(:journal).permit(:entry)
  end
end
