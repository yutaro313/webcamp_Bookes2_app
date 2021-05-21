class UsersController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "You have created book successfuly"
    else
      rende :books_path
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @book = @user.books
    # @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "You have updated user successfuly"
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
