class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation,
        :street,
        :country,
        :zip_code
      )
  end
end
