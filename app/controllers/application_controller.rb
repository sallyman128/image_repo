class ApplicationController < ActionController::Base
  
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if !!session[:user_id]
  end

  def render_login_if_not_logged_in
    unless !!current_user
      @error = "Must be logged in to access that page."
      render :"sessions/login"
    end
  end
  
end
