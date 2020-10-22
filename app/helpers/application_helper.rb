module ApplicationHelper

  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    # return head(:forbidden) unless session.include? :user_id
    if !session.include? :user_id
      flash[:error] = "Please log in to use TripTracker."
      redirect_to "/"
    end
  end

end
