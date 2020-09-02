class ReservationsController < ApplicationController
  include ExceptionHandler
  before_action :set_listing
  before_action :set_listing_reservation, only: %i[show update destroy]

  # def index
  #   render json: @listing.reservations, status: :ok
  # end

  # def show
  #   render json: @reservation, status: :ok
  # end

  def create
    @reservation = @listing.reservations.create!(reservation_params.merge(guest_id: current_user.id))
    render json: @reservation, status: :created
  end

  # def update
  #   @reservation.update(reservation_params)
  #   head :no_content
  # end

  # def destroy
  #   @reservation.destroy
  #   head :no_content
  # end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_listing_reservation
    @reservation = @listing.reservations.find_by!(id: params[:id]) if @listing
  end

  def reservation_params
    params.permit(:checkin_date, :checkout_date)
  end
end
