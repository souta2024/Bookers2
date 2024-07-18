class BooksController < ApplicationController

  def index
    @user_id = current_user.id
    @user = User.find(@user_id)
    @book_new = Book.new
    @book = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    @book_new.save
    redirect_to book_path(@book_new.id)
  end

  def show
    @book = Book.find(params[:id])
    @user_id = @book.user_id
    @user = User.find(@user_id)
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
