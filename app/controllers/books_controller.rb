class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def new
    @book = Book.new
  end

  def show
    @book= Book.find(params[:id])
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
       render :edit
    end
  end

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
