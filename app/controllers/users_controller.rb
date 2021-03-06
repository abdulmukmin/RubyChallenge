class UsersController < ApplicationController
  wrap_parameters :user, include: [:email, :password, :password_confirmation]
  skip_before_action :authenticate_request, :only => [ :create]

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
