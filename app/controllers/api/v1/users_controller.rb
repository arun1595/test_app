class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, status: 200

  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User does not exist' }, status: 404
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
