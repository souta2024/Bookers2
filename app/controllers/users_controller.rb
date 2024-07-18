class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user_id = @book.user_id
    @user = User.find(@user_id)
    @book_new = Book.new
  end

  def index
    @user_id = current_user.id
    @user = User.find(@user_id)
    @book_new = Book.new
    @users = User.all
  end

  def edit
  end
end
