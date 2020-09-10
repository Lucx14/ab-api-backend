class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_profile_owner, only: %i[show change_avatar]
  before_action :verify_profile_owner, only: %i[show change_avatar]

  def create
    user = User.create!(user_params)
    auth_details = AuthenticateUser.new(user.email, user.password).call
    response = {
      message: Messages::AuthMessages.account_created,
      auth_token: auth_details[:auth_token],
      user_id: auth_details[:data][:user_id],
      token_exp: auth_details[:data][:exp]
    }
    render json: response, status: :created
  end

  def change_avatar
    @profile_owner.update(user_params)
    render json: { message: 'Avatar successfully updated!' }, status: :ok
  end

  def show
    render json: @profile_owner, status: :ok
  end

  private

  def set_profile_owner
    @profile_owner = User.find(params[:user_id])
  end

  def profile_owner?
    @profile_owner.id == current_user.id
  end

  def verify_profile_owner
    raise(ExceptionHandler::PermissionError, Messages::AuthMessages.permission_error) unless profile_owner?
  end

  def user_params
    params.permit(:user_id, :first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
