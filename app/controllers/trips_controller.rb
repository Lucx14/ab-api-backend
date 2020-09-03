class TripsController < ApplicationController
  include ExceptionHandler
  before_action :set_my_trips
  before_action :set_trip, only: %i[show]

  def index
    render json: @my_trips, status: :ok
  end

  def show
    render json: @trip, status: :ok
  end

  private

  def set_my_trips
    @my_trips = current_user.trips
  end

  def set_trip
    @trip = @my_trips.find(params[:id])
  end
end
