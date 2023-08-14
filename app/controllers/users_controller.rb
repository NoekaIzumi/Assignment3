class UsersController < ApplicationController
  
  def edit
  @user = User.find(params[:id])
  end

  def show
  @user = User.find(params[:id])
  end

  def index
    users = User.all
  end

 
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
