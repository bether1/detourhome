class Traveler::JournalsController < ApplicationController
  before_action :authenticate_user!

  def create
    @destination = Destination.find(params[:destination_id])
    @destination.journals.create(journal_params.merge(user: current_user))
    redirect_to traveler_trip_destination_path(params[:trip_id], params[:destination_id])
  end

  private

  def journal_params
    params.require(:journal).permit(:entry)
  end
end
