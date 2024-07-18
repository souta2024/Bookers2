class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = @user.books
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
