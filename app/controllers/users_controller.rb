class UsersController < ApplicationController
  before_action :require_logged_in

  def show
    # raise @user.inspect
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      flash[:error] = "User not authorized to other user resources."
      redirect_to "/"
    end
end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      # binding.pry
      session[:user_id] = @user.id
      # current_user = @user
      redirect_to user_path(@user)
    else
      flash[:error] = "User signup failed: #{@user.errors.full_messages.to_sentence}"
      # redirect_to '/users/new'
      render :new 
    end
  end

  private
  def user_params
    params.require(:user).permit(:handle, :email, :password)
  end

end
