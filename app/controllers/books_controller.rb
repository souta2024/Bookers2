class BooksController < ApplicationController

  before_action :authenticate_user!

  def index
    @user_id = current_user.id
    @user = User.find(@user_id)
    @book_new = Book.new
    @book = Book.all
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @user_id = current_user.id
      @user = User.find(@user_id)
      @book = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user_id = @book.user_id
    @user = User.find(@user_id)
    @book_new = Book.new
  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    if  @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      render :edit
    end
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

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
