class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  
  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: UserSerializer.new(user), status: :ok
  end

  private

  def user_params
    params.permit(:name)
  end
end
