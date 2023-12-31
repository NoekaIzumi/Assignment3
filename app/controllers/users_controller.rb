class UsersController < ApplicationController

  def edit
  user = User.find(params[:id])
  unless user== current_user
    redirect_to user_path(current_user.id)
  end
   @user = User.find(params[:id])
  end

  def show
   @user = User.find(params[:id])
   @books= @user.books
   @book =Book.new
  end

  def index
   @users = User.all
   @user = User.find(current_user.id)

   @book =Book.new
  end


  def update
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user.id),status: :unprocessable_entity
  end

  @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] ="You have updated user successfully."
    else
       flash.now[:alert] ="errors prohibited this book from being saved:"
       render :edit, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
