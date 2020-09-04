class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update destroy]

  def index
    @listings = Listing.all
    render json: @listings, status: :ok
  end

  def show
    render json: @listing, status: :ok
  end

  def create
    @listing = current_user.listings.create!(listing_params)
    render json: @listing, status: :created
  end

  def update
    @listing.update(listing_params)
    head :no_content
  end

  def destroy
    @listing.destroy
    head :no_content
  end

  private

  def listing_params
    params.permit(
      :listing_type, :short_description, :long_description,
      :total_occupancy, :total_bedrooms, :total_beds,
      :country, :city, :street,
      :house_number, :post_code, :latitude,
      :longitude, :has_kitchen, :has_wifi,
      :has_tv, :has_air_con, :price_per_night, images: []
    )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
