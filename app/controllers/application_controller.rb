class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # methods in application controller is available in all controllers
  # since other controllers inherit from it

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  

end
