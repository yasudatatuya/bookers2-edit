class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
