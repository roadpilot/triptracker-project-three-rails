class UsersController < ApplicationController

  # SHOW ONLY CURRENT USER SHOW PAGE IF LOGGED IN
  def show
    if logged_in? and 
      if params[:id].to_i == current_user.id
        @user = User.find(params[:id])
      else
        flash[:error] = "User not authorized to other user resources."
        redirect_to "/"
      end
    else
        flash[:error] = "Please log in to use TripTracker."
        redirect_to "/"
    end
end

  # BUILD INSTANCE FOR NEW USER PAGE
  def new
    @user = User.new
  end

  # CREATE NEW USER
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "User signup failed: #{@user.errors.full_messages.to_sentence}"
      render :new 
    end
  end

  # STRONG PARAMS PERMISSIONS
  private
  def user_params
    params.require(:user).permit(:handle, :email, :password)
  end

end
