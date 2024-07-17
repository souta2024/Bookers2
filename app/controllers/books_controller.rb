class BooksController < ApplicationController
  def index
    @user_id = current_user.id
    @user = User.find(@user_id)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user.id = current_user.id
    @book.save
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
