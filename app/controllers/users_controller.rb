class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to images_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images
    current_user
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end