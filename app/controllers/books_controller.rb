class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def new
    @book = Book.new
  end

  def show
    @book= Book.find(params[:id])
    @user =@book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @user = User.find(current_user.id)
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] ="errors prohibited this book from being saved:"
      render action: :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] ="You have updated book successfully."
    else
       flash.now[:alert] ="errors prohibited this book from being saved:"
       render :edit
    end
  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
