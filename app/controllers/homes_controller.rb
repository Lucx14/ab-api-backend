class HomesController < ApplicationController
  include ExceptionHandler
  before_action :set_home, only: %i[show update destroy]

  def index
    @homes = Home.all
    render json: @homes, status: :ok
  end

  def show
    render json: @home, status: :ok
  end

  def create
    @home = Home.create!(home_params)
    render json: @home, status: :created
  end

  def update
    @home.update(home_params)
    head :no_content
  end

  def destroy
    @home.destroy
    head :no_content
  end

  private

  def home_params
    params.permit(
      :home_type, :short_description, :long_description,
      :total_occupancy, :total_bedrooms, :total_beds,
      :country, :city, :street,
      :house_number, :post_code, :latitude,
      :longitude, :has_kitchen, :has_wifi,
      :has_tv, :has_air_con
    )
  end

  def set_home
    @home = Home.find(params[:id])
  end
end
