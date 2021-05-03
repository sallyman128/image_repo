class SessionsController < ApplicationController

  def login
  end
  
  def logout
  end

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to images_path
    else
      @error = "Invalid username or password"
      render :login
    end
  end

  def destroy
    session.destroy
    redirect_to logout_path
  end
end