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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
