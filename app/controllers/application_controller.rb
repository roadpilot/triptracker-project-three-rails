class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    redirect_to "/"
  end

  helper_method :current_user
  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  helper_method :require_logged_in
  def require_logged_in
    return head(:forbidden) unless session.include? :user_id
  end

end

