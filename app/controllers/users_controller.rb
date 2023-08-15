class UsersController < ApplicationController

  def edit
   @user = User.find(params[:id])
   @books = @user.books
  end

  def show
   @user = User.find(params[:id])
  end

  def index
   users = User.all
  end


  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(current_user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
