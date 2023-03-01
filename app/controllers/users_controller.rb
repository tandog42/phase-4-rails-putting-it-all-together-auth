class UsersController < ApplicationController
  skip_before_action :authorize, only: :create


  def create 
user = User.create!(permitted_params)
  session[:user_id] = user.id
  render json: user, status: :created
end

def show
  render json: @current_user
end


  private

  def permitted_params
    params.permit(:username, :password, :password_confirmation, :img_url, :bio)
end

end
