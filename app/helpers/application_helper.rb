module ApplicationHelper

  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    return head(:forbidden) unless session.include? :user_id
  end

end
