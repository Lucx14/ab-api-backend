class ReviewsController < ApplicationController
  include ExceptionHandler

  before_action :set_trip

  def create
    @review = @trip.reviews.create!(review_params.merge(guest_id: current_user.id, listing_id: @trip.listing.id))
    render json: @review, status: :created
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def review_params
    params
      .require(:review)
      .permit(:rating, :description)
  end
end
