class ReservationsController < ApplicationController
  include ExceptionHandler
  before_action :set_listing

  def create
    @reservation = @listing.reservations.create!(reservation_params.merge(guest_id: current_user.id))
    render json: @reservation, status: :created
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def reservation_params
    params.require(:reservation).permit(:checkin_date, :checkout_date)
  end
end
