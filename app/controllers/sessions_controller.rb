class SessionsController < ApplicationController

  def login
  end

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to images_path
    else

      redirect_to login_path
    end

  end

  def destroy
    session.destroy
    redirect_to images_path
  end
end