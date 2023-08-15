class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user.id=current_user.id
    @book.save
    redirect_to book_path
  end

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
