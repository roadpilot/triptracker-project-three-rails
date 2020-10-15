class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
  end

  helper_method :current_user
  def current_user
    User.find(session[:user_id])
  end
end

