class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def authenticate
    unless current_user
      redirect_to root_url, :flash => {:info => "You need to sign in first"}
      return false
    end
  end
  
  # handling the cancan redirect for error
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to users_path, :flash => {:error => exception.message}
  end

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
