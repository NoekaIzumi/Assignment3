class UsersController < ApplicationController

  def edit
   @user = User.find(params[:id])
  end

  def show
   @user = User.find(params[:id])
   @books= @user.books
  end

  def index
   @users = User.all
   @user = User.find(current_user.id)
   
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
